import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/widgets/custom_icon.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/const.dart';
import '../../../core/constraint/spacer.dart';
import '../../../model/response/pokemon_detail_response.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';

class HeaderDetail extends StatelessWidget {
  final PokemonDetailResponse detail;

  const HeaderDetail({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
          child: CustomIcon(
            iconData: "${AssetPath.vector}pokeball.svg",
            defaultColor: false,
            width: 80,
            height: 80,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...[
                    (detail.name?.length ?? 0) > 17
                        ? Expanded(
                            child: CustomText(
                              textToDisplay: detail.name?.capitalize() ?? "-",
                              textStyle: context.getTextTheme().titleLarge?.copyWith(fontWeight: FontWeight.w700),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          )
                        : CustomText(
                            textToDisplay: detail.name?.capitalize() ?? "-",
                            textStyle: context.getTextTheme().titleLarge?.copyWith(fontWeight: FontWeight.w700),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                          ),
                  ],
                  ...detail.types
                          ?.map((e) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: CustomIcon(
                                width: 30,
                                  height: 30,
                                  defaultColor: false,
                                  iconData:
                                      "${AssetPath.vector}${typePath[e.type?.name ?? 'normal'] ?? 'normal.svg'}")))
                          .toList() ??
                      []
                ],
              ),
              Row(
                children: [
                  Builder(builder: (context) {
                    final images = <String>[];
                    if (detail.sprites?.frontDefault != null) {
                      images.add(detail.sprites!.frontDefault!);
                    }
                    if (detail.sprites?.frontFemale != null) {
                      images.add(detail.sprites!.frontFemale!);
                    }
                    if (detail.sprites?.frontShiny != null) {
                      images.add(detail.sprites!.frontShiny!);
                    }
                    if (detail.sprites?.frontShinyFemale != null) {
                      images.add(detail.sprites!.frontShinyFemale!);
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: images.map((e) => _pokemonImage(e, e.contains('female'))).toList(),
                      ),
                    );
                  }),
                  tenPx
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pokemonImage(String url, bool isFemale) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
              child: Align(
                alignment: Alignment.center,
                child: CustomImageNetwork(
                  imageUrl: url,
                  width: 45,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: CustomIcon(
                  width: 15,
                  height: 15,
                  defaultColor: false,
                  iconData:
                  "${AssetPath.vector}${isFemale ? "female.svg" : "male.svg"}"))
        ],
      ),
    );
  }
}
