import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/helper/helper.dart';
import 'package:poke_app/model/response/pokemon_response.dart';
import 'package:poke_app/service/api_handling.dart';

import '../../../core/base/base_provider.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> with BaseProvider {
  PokemonBloc() : super(const PokemonState()) {
    on<GetPokemon>(_getPokemonList);
  }

  void _getPokemonList(GetPokemon event, Emitter<PokemonState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(status: PokemonStatus.loading));
    }
    if(await Helper().checkConnections()){
      await ApiHandling.hitApi(
        apiRep.apiService.getPokemonList(event.isReload ? 0 : (state.pokemonList?.length ?? 0), 25),
            (response) {
          if (response.results != null) {
            if (response.results!.isNotEmpty) {
              if (event.isReload) {
                emit(state.copyWith(
                    status: PokemonStatus.success,
                    hasNext: response.next != null,
                    pokemonList: response.results));
              } else {
                emit(state.copyWith(
                    status: PokemonStatus.success,
                    hasNext: response.next != null,
                    pokemonList: List.from(state.pokemonList ?? [])
                      ..addAll(response.results ?? [])));
              }
            } else {
              if (event.isReload) {
                emit(state.copyWith(status: PokemonStatus.empty));
              }
            }
          } else {
            if (event.isReload) {
              emit(state.copyWith(status: PokemonStatus.empty));
            }
          }
        },
            (e) {
          emit(state.copyWith(status: PokemonStatus.error, error: e.messageError));
        },
      );
    }else{
      emit(state.copyWith(status: PokemonStatus.noConnection));
    }

  }


}
