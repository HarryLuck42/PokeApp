import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/layout/comparing_pokemon/component/compared_pokemon_item.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_icon.dart';

class HistoryComparing extends StatelessWidget {
  final PokemonDetailResponse first;
  final PokemonDetailResponse second;
  const HistoryComparing({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ComparedPokemonItem(detail: first, color: Colors.red,)),
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
              Expanded(child: ComparedPokemonItem(detail: second, color: Colors.blue,)),
            ],
          ),
          sixteenPx,
        ],
      ),
    );
  }
}
