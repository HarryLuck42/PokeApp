part of 'pokemon_detail_bloc.dart';


class PokemonDetailEvent extends Equatable {

  @override
  List<Object?> get props => [];

}

class GetPokemonDetail extends PokemonDetailEvent{
  final String name;

  GetPokemonDetail({required this.name});

  @override
  List<Object?> get props => [name];
}

class GetAbility extends PokemonDetailEvent{
  final NameAndLinkAbi ability;

  GetAbility({required this.ability});

  @override
  List<Object?> get props => [ability];
}
