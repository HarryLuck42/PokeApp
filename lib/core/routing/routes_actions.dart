import 'package:flutter/material.dart';
import 'package:poke_app/core/routing/routes.dart';
import 'package:poke_app/layout/comparing_pokemon/argument/comparing_pokemon_argument.dart';
import 'package:poke_app/layout/comparing_pokemon/comparing_pokemon_screen.dart';
import 'package:poke_app/layout/home/home_screen.dart';
import 'package:poke_app/layout/pokemon_detail/pokemon_detail_screen.dart';
import 'package:poke_app/layout/settings/settings_screen.dart';
import 'package:poke_app/layout/splash/splash_screen.dart';

class RoutesActions {
  static List<Route<dynamic>> initialAction(_) {
    return [MaterialPageRoute(builder: (_) => const SplashScreen())];
  }

  static Route<dynamic> allActions(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.pokemonDetail:
        return MaterialPageRoute(
            builder: (_) =>
                PokemonDetailScreen(name: settings.arguments as String));
      case Routes.pokemonCompared:
        return MaterialPageRoute(
            builder: (_) => ComparingPokemonScreen(
                argument: settings.arguments as ComparingPokemonArgument));
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
