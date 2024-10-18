import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/base/base_provider.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

import '../../../model/response/pokemon_ability_response.dart';
import '../../../service/api_handling.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> with BaseProvider{
  PokemonDetailBloc() : super(const PokemonDetailState()) {
    on<GetPokemonDetail>(_getPokemonDetail);
    on<GetAbility>(_getAbility);
  }

  void _getPokemonDetail(GetPokemonDetail event, Emitter<PokemonDetailState> emit) async {
    final current = memoryAction.getPokemon();
    final detail = current.where((e) => e.name?.toLowerCase() == event.name.toLowerCase()).firstOrNull;
    emit(state.copyWith(status: PokemonDetailStatus.loading));
    if(detail != null){
      emit(state.copyWith(detail: detail.convert(), status: PokemonDetailStatus.success));
      for(final value in detail.abilities ?? <AbilitiesData>[]){
        final ability = value.ability;
        if(ability != null){
          add(GetAbility(ability: ability.convertAbi()));
        }
      }
    }else{
      await ApiHandling.hitApi(apiRep.apiService.getPokemonDetail(event.name), (response){
        try{

          memoryAction.saveDetail(response.convert());
          emit(state.copyWith(detail: response, status: PokemonDetailStatus.success));

          for(final value in response.abilities ?? <Abilities>[]){
            final ability = value.ability;
            if(ability != null){
              add(GetAbility(ability: ability.convertAbi()));
            }
          }

        }catch(e){
          routing.showSnackBar(snackBar: SnackBar(content: Text(e.toString())));
          emit(state.copyWith(status: PokemonDetailStatus.error, error: e.toString()));
        }
      }, (e){
        routing.showSnackBar(snackBar: SnackBar(content: Text(e.messageError)));
        emit(state.copyWith(status: PokemonDetailStatus.error, error: e.toString()));
      });
    }

  }
  void _getAbility(GetAbility event, Emitter<PokemonDetailState> emit) async {
    final id = event.ability.url?.split("/ability/").last.replaceAll("/", "");
    final ability = memoryAction.getAbilities().where((e) => e.name?.toLowerCase() == event.ability.name?.toLowerCase()).firstOrNull;

    if(ability != null){
      emit(state.copyWith(ability: List.from(state.ability)..add(ability), status: PokemonDetailStatus.success));
    }else{
      await ApiHandling.hitApi(apiRep.apiService.getPokemonAbility(id ?? ''), (response){
        try{
          if(response.effectEntries != null){
            List<EffectEntriesData> temp = [];
            final data = response.effectEntries!.where((e) => e.language?.name == 'en').first;
            emit(state.copyWith(ability: List.from(state.ability)..add(data.convert(event.ability.name ?? '-')), status: PokemonDetailStatus.success));
          }

        }catch(e){
          routing.showSnackBar(snackBar: SnackBar(content: Text(e.toString())));
          emit(state.copyWith(status: PokemonDetailStatus.error, error: e.toString()));
        }
      }, (e){
        routing.showSnackBar(snackBar: SnackBar(content: Text(e.messageError)));
        emit(state.copyWith(status: PokemonDetailStatus.error, error: e.toString()));
      });
    }
  }
}
