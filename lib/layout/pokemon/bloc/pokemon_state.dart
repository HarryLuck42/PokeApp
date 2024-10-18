part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, error, empty, loading, noConnection }

extension PokemonStatusX on PokemonStatus {
  bool get isInitial => this == PokemonStatus.initial;

  bool get isSuccess => this == PokemonStatus.success;

  bool get isError => this == PokemonStatus.error;

  bool get isEmpty => this == PokemonStatus.empty;

  bool get isLoading => this == PokemonStatus.loading;

  bool get isNoConnection => this == PokemonStatus.noConnection;
}

class PokemonState extends Equatable {
  final List<Pokemon>? pokemonList;
  final PokemonStatus status;
  final bool hasNext;
  final String? error;

  const PokemonState(
      {this.status = PokemonStatus.initial,
      List<Pokemon>? pokemonList,
      this.hasNext = false,
      String? error})
      : pokemonList = pokemonList ?? const [],
        error = error ?? "";

  @override
  List<Object?> get props => [status, pokemonList, hasNext, error];

  PokemonState copyWith(
      {List<Pokemon>? pokemonList,
      PokemonStatus? status,
      bool? hasNext,
      String? error}) {
    return PokemonState(
        pokemonList: pokemonList ?? this.pokemonList,
        status: status ?? this.status,
        hasNext: hasNext ?? this.hasNext,
        error: status == PokemonStatus.error ? error : null);
  }
}
