import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/layout/comparing_pokemon/bloc/comparing_pokemon_bloc.dart';

import '../../../core/constraint/const.dart';
import '../../../model/response/pokemon_response.dart';
import '../../../widgets/custom_gesture.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';

class ChooseComparingItem extends StatelessWidget {
  final Pokemon pokemon;
  final bool isSelected;
  const ChooseComparingItem({super.key, required this.pokemon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final double itemHeight = context.getHeight();
    final id = pokemon.url?.getId();
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: BlocBuilder<ComparingPokemonBloc, ComparingPokemonState>(
        builder: (context, state) {
          return CustomGesture(
            onTap: () async {
              if(isSelected && pokemon == state.firstPokemon){
                if(state.secondPokemon != null){
                  context
                      .read<ComparingPokemonBloc>()
                      .add(ChooseFirst(pokemon: state.secondPokemon!));
                  await Future.delayed(const Duration(milliseconds: 500));
                  context
                      .read<ComparingPokemonBloc>()
                      .add(RemoveSecond());
                }else{
                  context
                      .read<ComparingPokemonBloc>()
                      .add(RemoveFirst());
                }

              }else if(isSelected && pokemon == state.secondPokemon){
                context
                    .read<ComparingPokemonBloc>()
                    .add(RemoveSecond());
              }else if (state.firstPokemon == null) {
                context
                    .read<ComparingPokemonBloc>()
                    .add(ChooseFirst(pokemon: pokemon));
              } else if (state.secondPokemon == null) {
                context
                    .read<ComparingPokemonBloc>()
                    .add(ChooseSecond(pokemon: pokemon));
              } else {
                context.read<ComparingPokemonBloc>().routing.showSnackBar(
                    snackBar: SnackBar(
                        content: CustomText(
                            textToDisplay:
                            lang(context).compareMessage ?? "Please clear first before choose pokemon")));
              }
            },
            radius: 12,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? context.getColorScheme().primary
                          : const Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 2.6,
                      spreadRadius: 0,
                      offset: const Offset(
                        1.95,
                        1.95,
                      ),
                    ),
                  ],
                  color: context.getColorScheme().secondaryContainer),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child: CustomImageNetwork(
                      imageUrl: "$baseImageUrl$id.png",
                      width: double.infinity,
                      height: itemHeight * 0.17,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: CustomText(
                      textToDisplay: pokemon.name?.capitalize() ?? "",
                      textStyle: context
                          .getTextTheme()
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
