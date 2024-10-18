import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/initial/bloc/app_bloc.dart';
import 'package:poke_app/layout/choose_pokemon/bloc/choose_pokemon_bloc.dart';
import 'package:poke_app/layout/comparing_pokemon/bloc/comparing_pokemon_bloc.dart';
import 'package:poke_app/layout/pokemon/bloc/pokemon_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../layout/pokemon_detail/bloc/pokemon_detail_bloc.dart';

class Multiproviders{
  static List<SingleChildWidget> inject() => [
    BlocProvider<AppBloc>(create: (_) => AppBloc()),
    BlocProvider<PokemonBloc>(create: (_) => PokemonBloc()),
    BlocProvider<ChoosePokemonBloc>(create: (_) => ChoosePokemonBloc()),
    BlocProvider<PokemonDetailBloc>(create: (_) => PokemonDetailBloc()),
    BlocProvider<ComparingPokemonBloc>(create: (_) => ComparingPokemonBloc())
  ];
}