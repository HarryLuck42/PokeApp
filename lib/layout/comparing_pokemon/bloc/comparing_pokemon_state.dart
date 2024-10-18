part of 'comparing_pokemon_bloc.dart';

enum ComparingPokemonStatus {
  initial,
  success,
  error,
  empty,
  loading,
  noConnection
}

extension ComparingPokemonStatusX on ComparingPokemonStatus {
  bool get isInitial => this == ComparingPokemonStatus.initial;

  bool get isSuccess => this == ComparingPokemonStatus.success;

  bool get isError => this == ComparingPokemonStatus.error;

  bool get isEmpty => this == ComparingPokemonStatus.empty;

  bool get isLoading => this == ComparingPokemonStatus.loading;

  bool get isNoConnection => this == ComparingPokemonStatus.noConnection;
}

class ComparingPokemonState extends Equatable {
  final PokemonDetailResponse? first;
  final PokemonDetailResponse? second;
  final ComparingPokemonStatus status;
  final List<Pokemon>? pokemonList;
  final Pokemon? firstPokemon;
  final Pokemon? secondPokemon;
  final int page;

  const ComparingPokemonState(
      {this.first,
      this.second,
      this.status = ComparingPokemonStatus.initial,
      List<Pokemon>? pokemonList,
      this.firstPokemon,
      this.secondPokemon,
      this.page = 0})
      : pokemonList = pokemonList ?? const [];

  @override
  List<Object?> get props =>
      [first, second, status, pokemonList, firstPokemon, secondPokemon, page];

  ComparingPokemonState copyWith(
      {PokemonDetailResponse? first,
      PokemonDetailResponse? second,
      ComparingPokemonStatus? status,
      List<Pokemon>? pokemonList,
      Pokemon? firstPokemon,
      Pokemon? secondPokemon,
      int? page}) {
    return ComparingPokemonState(
        first: first ?? this.first,
        second: second ?? this.second,
        status: status ?? this.status,
        pokemonList: pokemonList ?? this.pokemonList,
        firstPokemon: firstPokemon,
        secondPokemon: secondPokemon,
        page: page ?? this.page);
  }
}
