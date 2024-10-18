import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/extention/extention.dart';

class CustomLoading extends StatelessWidget {
  final double size;

  const CustomLoading({Key? key, this.size = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "${AssetPath.json}loading.json",
      width: size * 9 * context.scaleDiagonal(),
      height: size * 3 * context.scaleDiagonal(),
    );
  }
}