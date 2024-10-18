import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/layout/choose_pokemon/bloc/choose_pokemon_bloc.dart';

import '../../../core/constraint/const.dart';
import '../../../model/response/pokemon_response.dart';
import '../../../widgets/custom_gesture.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';

class ChoosePokemonAdapter extends StatelessWidget {
  final Pokemon pokemon;
  final bool isSelected;

  const ChoosePokemonAdapter(
      {super.key, required this.pokemon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final double itemHeight = context.getHeight();
    final id = pokemon.url?.getId();
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: BlocBuilder<ChoosePokemonBloc, ChoosePokemonState>(
        builder: (context, state) {
          return CustomGesture(
            onTap: () async {
              if(isSelected && pokemon == state.first){
                if(state.second != null){
                  context
                      .read<ChoosePokemonBloc>()
                      .add(ChooseFirst(pokemon: state.second!));
                  await Future.delayed(const Duration(milliseconds: 500));
                  context
                      .read<ChoosePokemonBloc>()
                      .add(RemoveSecond());
                }else{
                  context
                      .read<ChoosePokemonBloc>()
                      .add(RemoveFirst());
                }

              }else if(isSelected && pokemon == state.second){
                context
                    .read<ChoosePokemonBloc>()
                    .add(RemoveSecond());
              }else if (state.first == null) {
                context
                    .read<ChoosePokemonBloc>()
                    .add(ChooseFirst(pokemon: pokemon));
              } else if (state.second == null) {
                context
                    .read<ChoosePokemonBloc>()
                    .add(ChooseSecond(pokemon: pokemon));
              } else {
                context.read<ChoosePokemonBloc>().routing.showSnackBar(
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
                      textToDisplay: pokemon.name?.capitalize() ?? "-",
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
