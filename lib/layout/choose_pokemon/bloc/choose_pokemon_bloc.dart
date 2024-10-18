import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_app/core/base/base_provider.dart';

import '../../../core/helper/helper.dart';
import '../../../model/response/pokemon_response.dart';
import '../../../service/api_handling.dart';

part 'choose_pokemon_event.dart';
part 'choose_pokemon_state.dart';

class ChoosePokemonBloc extends Bloc<ChoosePokemonEvent, ChoosePokemonState> with BaseProvider {
  ChoosePokemonBloc() : super(const ChoosePokemonState()) {
    on<GetPokemon>(_getPokemonList);
    on<ChooseFirst>((event, emit){
      emit(state.copyWith(first: event.pokemon, second: state.second));
    });
    on<ChooseSecond>((event, emit){
      emit(state.copyWith(second: event.pokemon, first: state.first));
    });
    on<RemoveFirst>((event, emit){
      emit(state.copyWith(first: null, second: state.second ));
    });
    on<RemoveSecond>((event, emit){
      emit(state.copyWith(second: null, first: state.first));
    });
  }

  void _getPokemonList(GetPokemon event, Emitter<ChoosePokemonState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(status: ChoosePokemonStatus.loading, first: state.first, second: state.second));
    }
    if(await Helper().checkConnections()){
      await ApiHandling.hitApi(
        apiRep.apiService.getPokemonList(event.isReload ? 0 : (state.pokemonList?.length ?? 0), 20),
            (response) {
          if (response.results != null) {
            if (response.results!.isNotEmpty) {
              if (event.isReload) {
                emit(state.copyWith(
                    status: ChoosePokemonStatus.success,
                    hasNext: response.next != null,
                    pokemonList: response.results, first: state.first, second: state.second));
              } else {
                emit(state.copyWith(
                    status: ChoosePokemonStatus.success,
                    hasNext: response.next != null,
                    pokemonList: List.from(state.pokemonList ?? [])
                      ..addAll(response.results ?? []), first: state.first, second: state.second));
              }
            } else {
              if (event.isReload) {
                emit(state.copyWith(status: ChoosePokemonStatus.empty, first: state.first, second: state.second));
              }
            }
          } else {
            if (event.isReload) {
              emit(state.copyWith(status: ChoosePokemonStatus.empty, first: state.first, second: state.second));
            }
          }
        },
            (e) {
          emit(state.copyWith(status: ChoosePokemonStatus.error, error: e.messageError, first: state.first, second: state.second));
        },
      );
    }else{
      emit(state.copyWith(status: ChoosePokemonStatus.noConnection, first: state.first, second: state.second));
    }

  }
}
