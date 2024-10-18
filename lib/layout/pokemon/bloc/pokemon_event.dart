part of 'pokemon_bloc.dart';

class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPokemon extends PokemonEvent{
  GetPokemon({
    required this.isReload
  });
  final bool isReload;
  @override
  List<Object?> get props => [isReload];
}
