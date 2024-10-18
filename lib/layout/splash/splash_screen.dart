import 'package:flutter/material.dart';
import 'package:poke_app/core/base/base_state.dart';
import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/routing/routing.dart';

import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset(
              '${AssetPath.image}cloud.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 200,
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  '${AssetPath.image}pokeball.webp',
                  width: 200,
                  height: 200,
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            child: Container(
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Image.asset(
                  '${AssetPath.image}text_pokemon.png',
                  width: 200,
                  height: 200,
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              '${AssetPath.image}green_hill.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              width: 200,
              height: 400,
              '${AssetPath.image}charizard.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Image.asset(
              width: 50,
              height: 400,
              '${AssetPath.image}ash.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: -20,
            bottom: -90,
            child: Image.asset(
              width: 200,
              height: 400,
              '${AssetPath.image}pikachu.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: -60,
            bottom: 120,
            child: Image.asset(
              width: 220,
              height: 400,
              '${AssetPath.image}mewt.webp',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: -10,
            bottom: -90,
            child: Image.asset(
              width: 200,
              height: 400,
              '${AssetPath.image}bulbasaur.webp',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Routing().moveReplacement(Routes.home);
    });
  }
}
