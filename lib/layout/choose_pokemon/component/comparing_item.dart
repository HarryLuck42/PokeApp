import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/model/response/pokemon_response.dart';

import '../../../core/constraint/const.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';

class ComparingItem extends StatelessWidget {
  final Pokemon pokemon;

  const ComparingItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final id = pokemon.url?.getId();
    return Container(
      padding: const EdgeInsets.all(10),
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
      ], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            child: CustomImageNetwork(
              imageUrl: "$baseImageUrl$id.png",
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          CustomText(
            textToDisplay: pokemon.name?.capitalize() ?? "-",
            textStyle: context
                .getTextTheme()
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
