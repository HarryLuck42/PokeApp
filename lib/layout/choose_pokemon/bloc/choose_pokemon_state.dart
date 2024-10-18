part of 'choose_pokemon_bloc.dart';

enum ChoosePokemonStatus {
  initial,
  success,
  error,
  empty,
  loading,
  noConnection
}

extension ChoosePokemonStatusX on ChoosePokemonStatus {
  bool get isInitial => this == ChoosePokemonStatus.initial;

  bool get isSuccess => this == ChoosePokemonStatus.success;

  bool get isError => this == ChoosePokemonStatus.error;

  bool get isEmpty => this == ChoosePokemonStatus.empty;

  bool get isLoading => this == ChoosePokemonStatus.loading;

  bool get isNoConnection => this == ChoosePokemonStatus.noConnection;
}

class ChoosePokemonState extends Equatable {
  final List<Pokemon>? pokemonList;
  final ChoosePokemonStatus status;
  final bool hasNext;
  final String? error;
  final Pokemon? first;
  final Pokemon? second;

  const ChoosePokemonState(
      {this.status = ChoosePokemonStatus.initial,
      List<Pokemon>? pokemonList,
      this.hasNext = false,
      String? error,
      this.first,
      this.second})
      : pokemonList = pokemonList ?? const [],
        error = error ?? "";

  @override
  List<Object?> get props => [status, pokemonList, hasNext, error, first, second];

  ChoosePokemonState copyWith(
      {List<Pokemon>? pokemonList,
      ChoosePokemonStatus? status,
      bool? hasNext,
      String? error,
      Pokemon? first,
      Pokemon? second}) {
    return ChoosePokemonState(
      pokemonList: pokemonList ?? this.pokemonList,
      status: status ?? this.status,
      hasNext: hasNext ?? this.hasNext,
      error: status == ChoosePokemonStatus.error ? error : null,
      first: first,
      second: second,
    );
  }
}
