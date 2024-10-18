import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_text.dart';

class PokemonStats extends StatelessWidget {
  final PokemonDetailResponse detail;

  const PokemonStats({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final hp = detail.stats?.where((e) => e.stat?.name == "hp").first;
    final attack = detail.stats?.where((e) => e.stat?.name == "attack").first;
    final defense = detail.stats?.where((e) => e.stat?.name == "defense").first;
    final specialAttack =
        detail.stats?.where((e) => e.stat?.name == "special-attack").first;
    final specialDefense =
        detail.stats?.where((e) => e.stat?.name == "special-defense").first;
    final speed = detail.stats?.where((e) => e.stat?.name == "speed").first;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: context.getColorScheme().onSecondary,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.24),
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(
                0,
                3,
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailItem("HP", hp?.baseStat?.toString() ?? "-"),
          _detailItem(lang(context).attack ?? "Attack", attack?.baseStat?.toString() ?? "-"),
          _detailItem(lang(context).defense ?? "Defense", defense?.baseStat?.toString() ?? "-"),
          _detailItem(lang(context).speed ?? "Speed", speed?.baseStat?.toString() ?? "-"),
          _detailItem(
              lang(context).specialAttack ?? "Special Attack", specialAttack?.baseStat?.toString() ?? "-"),
          _detailItem(
              lang(context).specialDefense ?? "Special Defense", specialDefense?.baseStat?.toString() ?? "-"),
        ],
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 5 ,
            child: CustomText(
                textToDisplay: title,
                textAlign: TextAlign.start,
                textStyle: const TextStyle(fontWeight: FontWeight.w700))),
        const CustomText(textToDisplay: ":"),
        fourPx,
        Expanded(
            flex: 2,
            child: CustomText(
              textToDisplay: value,
              textAlign: TextAlign.start,
              maxLines: 3,
            )),
      ],
    );
  }
}
