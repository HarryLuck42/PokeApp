import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/base/base_provider.dart';
import 'package:poke_app/core/helper/helper.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';
import 'package:poke_app/widgets/custom_text.dart';

import '../../../model/response/pokemon_response.dart';
import '../../../service/api_handling.dart';

part 'comparing_pokemon_event.dart';
part 'comparing_pokemon_state.dart';

class ComparingPokemonBloc extends Bloc<ComparingPokemonEvent, ComparingPokemonState> with BaseProvider {
  ComparingPokemonBloc() : super(const ComparingPokemonState()) {
    on<GetFirstDetail>(_getFirstDetail);
    on<GetSecondDetail>(_getSecondDetail);
    on<GetPokemon>(_getPokemonList);
    on<ChooseFirst>((event, emit){
      emit(state.copyWith(firstPokemon: event.pokemon, secondPokemon: state.secondPokemon));
    });
    on<ChooseSecond>((event, emit){
      emit(state.copyWith(secondPokemon: event.pokemon, firstPokemon: state.firstPokemon));
    });
    on<RemoveFirst>((event, emit){
      emit(state.copyWith(firstPokemon: null, secondPokemon: state.secondPokemon));
    });
    on<RemoveSecond>((event, emit){
      emit(state.copyWith(secondPokemon: null, firstPokemon: state.firstPokemon));
    });
    on<OnChangePage>((event, emit){
      emit(state.copyWith(page: event.i));
    });
  }

  void _getFirstDetail(GetFirstDetail event, Emitter<ComparingPokemonState> emit) async {
    if(await Helper().checkConnections()){
      final current = memoryAction.getPokemon();
      final detail = current.where((e) => e.name?.toLowerCase() == event.name.toLowerCase()).firstOrNull;
      emit(state.copyWith(status: ComparingPokemonStatus.loading));
      if(detail != null){
        emit(state.copyWith(first: detail.convert()));
        add(GetSecondDetail(name: event.secondName));
      }else{
        await ApiHandling.hitApi(apiRep.apiService.getPokemonDetail(event.name), (response){
          try{

            memoryAction.saveDetail(response.convert());
            emit(state.copyWith(first: response));
            add(GetSecondDetail(name: event.secondName));
          }catch(e){
            routing.showSnackBar(snackBar: SnackBar(content: Text(e.toString())));
            emit(state.copyWith(status: ComparingPokemonStatus.error));
          }
        }, (e){
          routing.showSnackBar(snackBar: SnackBar(content: Text(e.messageError)));
          emit(state.copyWith(status: ComparingPokemonStatus.error));
        });
      }
    }else{
      emit(state.copyWith(status: ComparingPokemonStatus.noConnection));
    }

  }

  void _getSecondDetail(GetSecondDetail event, Emitter<ComparingPokemonState> emit) async {
    final current = memoryAction.getPokemon();
    final detail = current.where((e) => e.name?.toLowerCase() == event.name.toLowerCase()).firstOrNull;
    emit(state.copyWith(status: ComparingPokemonStatus.loading));
    if(detail != null){
      emit(state.copyWith(second: detail.convert(), status: ComparingPokemonStatus.success));
    }else{
      await ApiHandling.hitApi(apiRep.apiService.getPokemonDetail(event.name), (response){
        try{

          memoryAction.saveDetail(response.convert());
          emit(state.copyWith(second: response, status: ComparingPokemonStatus.success));
        }catch(e){
          routing.showSnackBar(snackBar: SnackBar(content: Text(e.toString())));
          emit(state.copyWith(status: ComparingPokemonStatus.error));
        }
      }, (e){
        routing.showSnackBar(snackBar: SnackBar(content: Text(e.messageError)));
        emit(state.copyWith(status: ComparingPokemonStatus.error));
      });
    }
  }

  void _getPokemonList(GetPokemon event, Emitter<ComparingPokemonState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(status: ComparingPokemonStatus.loading, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
    }
    if(await Helper().checkConnections()){
      await ApiHandling.hitApi(
        apiRep.apiService.getPokemonList(event.isReload ? 0 : (state.pokemonList?.length ?? 0), 20),
            (response) {
          if (response.results != null) {
            if (response.results!.isNotEmpty) {
              if (event.isReload) {
                emit(state.copyWith(
                    status: ComparingPokemonStatus.success,
                    pokemonList: response.results, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
              } else {
                emit(state.copyWith(
                    status: ComparingPokemonStatus.success,
                    pokemonList: List.from(state.pokemonList ?? [])
                      ..addAll(response.results ?? []), firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
              }
            } else {
              if (event.isReload) {
                emit(state.copyWith(status: ComparingPokemonStatus.empty, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
              }
            }
          } else {
            if (event.isReload) {
              emit(state.copyWith(status: ComparingPokemonStatus.empty, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
            }
          }
        },
            (e) {
          routing.showSnackBar(snackBar: SnackBar(content: CustomText(textToDisplay: e.messageError)));
          emit(state.copyWith(status: ComparingPokemonStatus.error, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
        },
      );
    }else{
      emit(state.copyWith(status: ComparingPokemonStatus.noConnection, firstPokemon: state.firstPokemon, secondPokemon: state.secondPokemon));
    }

  }
}
