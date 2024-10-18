part of 'comparing_pokemon_bloc.dart';

class ComparingPokemonEvent extends Equatable {
  const ComparingPokemonEvent();

  @override
  List<Object?> get props => [];
}

class GetFirstDetail extends ComparingPokemonEvent {
  final String name;
  final String secondName;

  const GetFirstDetail({required this.name, required this.secondName});

  @override
  List<Object?> get props => [name, secondName];
}

class GetSecondDetail extends ComparingPokemonEvent {
  final String name;

  const GetSecondDetail({required this.name});

  @override
  List<Object?> get props => [name];
}

class GetPokemon extends ComparingPokemonEvent {
  const GetPokemon({required this.isReload});

  final bool isReload;

  @override
  List<Object?> get props => [isReload];
}

class ChooseFirst extends ComparingPokemonEvent {
  const ChooseFirst({required this.pokemon});

  final Pokemon pokemon;

  @override
  List<Object?> get props => [pokemon];
}

class ChooseSecond extends ComparingPokemonEvent {
  const ChooseSecond({required this.pokemon});

  final Pokemon pokemon;

  @override
  List<Object?> get props => [pokemon];
}

class RemoveFirst extends ComparingPokemonEvent {
  @override
  List<Object?> get props => [];
}

class RemoveSecond extends ComparingPokemonEvent {
  @override
  List<Object?> get props => [];
}

class OnChangePage extends ComparingPokemonEvent {
  final int i;

  const OnChangePage({required this.i});

  @override
  List<Object?> get props => [i];
}
