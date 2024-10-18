import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/widgets/custom_icon.dart';

import '../../../core/constraint/spacer.dart';
import '../../../model/response/pokemon_detail_response.dart';
import '../../../widgets/custom_text.dart';

class FirstBodyDetail extends StatelessWidget {
  final PokemonDetailResponse detail;

  const FirstBodyDetail({super.key, required this.detail});

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
      width: double.infinity,
      height: context.getHeight() * 0.27,
      margin: const EdgeInsets.symmetric( vertical: 4),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIcon(
                    iconData:
                        detail.sprites?.other?.dreamWorld?.frontDefault ?? "",
                    width: context.getWidth() * 0.5,
                    height: context.getWidth() * 0.5,
                    fit: BoxFit.cover,
                    isNetwork: true,
                    defaultColor: false,
                  ),
                  eightPx,
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              width: (context.getWidth() * 0.5),
                decoration: BoxDecoration(color: context.getColorScheme().onSecondary.withOpacity(0.6)),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailItem(lang(context).height ?? "Height", "${detail.height?.toString()} cm" ?? "-"),
                _detailItem(lang(context).weight ?? "Weight", "${detail.weight?.toString()} kg" ?? "-"),
                _detailItem("HP", hp?.baseStat?.toString() ?? "-"),
                _detailItem(lang(context).attack ?? "Attack", attack?.baseStat?.toString() ?? "-"),
                _detailItem(lang(context).defense ?? "Defense", defense?.baseStat?.toString() ?? "-"),
                _detailItem(lang(context).speed ?? "Speed", speed?.baseStat?.toString() ?? "-"),
                _detailItem(
                    lang(context).specialAttack ?? "Special Attack", specialAttack?.baseStat?.toString() ?? "-"),
                _detailItem(lang(context).specialDefense ?? "Special Defense",
                    specialDefense?.baseStat?.toString() ?? "-"),
              ],
            )),
          )
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
            flex: 2,
            child: CustomText(
                textToDisplay: title,
                textAlign: TextAlign.start,
                textStyle: const TextStyle(fontWeight: FontWeight.w700))),
        const CustomText(textToDisplay: ":"),
        fourPx,
        Expanded(
            flex: 1,
            child: CustomText(
              textToDisplay: value,
              textAlign: TextAlign.start,
              maxLines: 3,
            )),
      ],
    );
  }
}
