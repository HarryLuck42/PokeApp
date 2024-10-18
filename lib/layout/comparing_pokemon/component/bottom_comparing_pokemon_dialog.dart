import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/layout/comparing_pokemon/bloc/comparing_pokemon_bloc.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';
import '../../../model/response/pokemon_response.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon.dart';
import '../../../widgets/custom_text.dart';
import '../../choose_pokemon/component/comparing_item.dart';
import '../argument/comparing_pokemon_argument.dart';

class BottomComparingPokemonDialog extends StatelessWidget {
  final Pokemon? first;
  final Pokemon? second;

  const BottomComparingPokemonDialog({super.key, this.first, this.second});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context
            .getColorScheme()
            .onSecondary,),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: first != null
                  ? ComparingItem(pokemon: first!)
                  : const SizedBox.shrink()),
              eightPx,
              CustomIcon(
                iconData: "${AssetPath.vector}comparing.svg",
                width: 50,
                height: 50,
                color: context
                    .getColorScheme()
                    .primary,
              ),
              eightPx,
              Expanded(child: second != null
                  ? ComparingItem(pokemon: second!)
                  : const SizedBox.shrink()),
            ],
          ),
          sixteenPx,
          BlocBuilder<ComparingPokemonBloc, ComparingPokemonState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      width: double.infinity,
                      height: 40,
                      function: () {
                        context.read<ComparingPokemonBloc>().add(RemoveFirst());
                        context.read<ComparingPokemonBloc>().add(RemoveSecond());
                      },
                      child: CustomText(
                        textToDisplay: lang(context).clear ?? "Clear",
                        textStyle: context
                            .getTextTheme()
                            .bodySmall
                            ?.copyWith(
                            color:
                            context
                                .getColorScheme()
                                .onPrimary),
                      ),
                    ),
                  ),
                  if(state.first != null && state.second != null)
                    tenPx,
                  if(state.first != null && state.second != null)
                    Expanded(
                      child: CustomElevatedButton(
                        width: double.infinity,
                        height: 40,
                        function: () {
                          if (state.first != null && state.second != null) {
                            Navigator.pop(context, ComparingPokemonArgument(
                                first: state.firstPokemon!, second: state.secondPokemon!));
                          }
                        },
                        child: CustomText(
                          textToDisplay: lang(context).comparing ?? "Compare",
                          textStyle: context
                              .getTextTheme()
                              .bodySmall
                              ?.copyWith(
                              color:
                              context
                                  .getColorScheme()
                                  .onPrimary),
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
