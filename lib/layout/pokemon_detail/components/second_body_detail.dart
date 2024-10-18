import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/core/themes/app_colors.dart';

import '../../../core/constraint/spacer.dart';
import '../../../initial/locale/localizations.dart';
import '../../../model/response/pokemon_ability_response.dart';
import '../../../model/response/pokemon_detail_response.dart';
import '../../../widgets/custom_text.dart';
import '../bloc/pokemon_detail_bloc.dart';

class SecondBodyDetail extends StatelessWidget {
  final PokemonDetailResponse detail;

  const SecondBodyDetail({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...[
                _detailItems(
                  context,
                    lang(context).moves ?? "Moves",
                    detail.moves?.map((e) => e.move?.name ?? "").toList() ??
                        []),
                twelvePx,
                CustomText(
                  textToDisplay: lang(context).abilities ?? "Abilities",
                  textStyle: context
                      .getTextTheme()
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700, color: PurpleLight),
                ),
                eightPx,
              ],
              ...state.ability.isNotEmpty
                  ? (state.ability
                          .map((e) => _abilityDetail(context, e.name ?? "-", e.convert()))
                          .toList())
                  : [const SizedBox.shrink()]
            ],
          ),
        );
      },
    );
  }

  Widget _abilityDetail(
      BuildContext context, String ability, EffectEntries data) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              textToDisplay: "- ${ability.capitalize()}",
              textStyle: context
                  .getTextTheme()
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
          fourPx,
          CustomText(
            textAlign: TextAlign.justify,
              textToDisplay: data.effect ?? (data.shortEffect ?? "-"),
              maxLines: 100,
              textStyle: context
                  .getTextTheme()
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500)),
          eightPx,
        ],
      ),
    );
  }

  Widget _detailItems(BuildContext context, String title, List<String?> values) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textToDisplay: title,
          textAlign: TextAlign.start,
          textStyle: context.getTextTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700, color: PurpleLight),
        ),
        fourPx,
        Builder(builder: (context) {
          String data = "";
          if (values.length > 2) {
            for (int i = 0; i < values.length; i++) {
              if (i == values.length - 1) {
                data += "& ${values[i]}";
              } else if (i == values.length - 2) {
                data += "${values[i]} ";
              } else {
                data += "${values[i]}, ";
              }
            }
          } else {
            if (values.isEmpty) {
              data = "-";
            } else if (values.length == 1) {
              data = values[0] ?? "-";
            } else {
              data = "${values[0]} & ${values[1]}";
            }
          }

          return CustomText(
            textToDisplay: data,
            textAlign: TextAlign.justify,
            textStyle: context.getTextTheme().bodyMedium,
            maxLines: 100,
          );
        }),
      ],
    );
  }
}
