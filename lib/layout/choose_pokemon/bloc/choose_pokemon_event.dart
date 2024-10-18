part of 'choose_pokemon_bloc.dart';

class ChoosePokemonEvent extends Equatable {
  const ChoosePokemonEvent();

  @override
  List<Object?> get props => [];
}

class GetPokemon extends ChoosePokemonEvent{
  const GetPokemon({
    required this.isReload
  });
  final bool isReload;
  @override
  List<Object?> get props => [isReload];
}

class ChooseFirst extends ChoosePokemonEvent{
  const ChooseFirst({
    required this.pokemon
  });
  final Pokemon pokemon;
  @override
  List<Object?> get props => [pokemon];
}

class ChooseSecond extends ChoosePokemonEvent{
  const ChooseSecond({
    required this.pokemon
  });
  final Pokemon pokemon;
  @override
  List<Object?> get props => [pokemon];
}

class RemoveFirst extends ChoosePokemonEvent{
  @override
  List<Object?> get props => [];
}

class RemoveSecond extends ChoosePokemonEvent{
  @override
  List<Object?> get props => [];
}
