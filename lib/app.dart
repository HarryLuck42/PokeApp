import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_app/core/config/env.dart';
import 'package:poke_app/core/constraint/enum.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/core/helper/helper.dart';
import 'package:poke_app/core/memory/hive/boxes.dart';
import 'package:poke_app/initial/screen.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';

import 'core/memory/shared/share_preference.dart';

final GlobalKey<ScaffoldState> materialAppKey = GlobalKey<ScaffoldState>();

void myAppStarts(EnvType environment)async{

  runZonedGuarded(() async{

    WidgetsFlutterBinding.ensureInitialized();
    Env.init(environment);
    await SharedPreference.onInitialSharedPreferences();
    Helper().systemUIOverlayTheme();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Hive.initFlutter();
    Hive.registerAdapter(PokemonDetailDataAdapter());
    Hive.registerAdapter(AbilitiesDataAdapter());
    Hive.registerAdapter(CriesDataAdapter());
    Hive.registerAdapter(HeldItemsDataAdapter());
    Hive.registerAdapter(VersionDetailsDataAdapter());
    Hive.registerAdapter(MovesDataAdapter());
    Hive.registerAdapter(SpritesDataAdapter());
    Hive.registerAdapter(OtherDataAdapter());
    Hive.registerAdapter(DreamWorldDataAdapter());
    Hive.registerAdapter(HomeDataAdapter());
    Hive.registerAdapter(OfficialArtworkDataAdapter());
    Hive.registerAdapter(ShowdownDataAdapter());
    Hive.registerAdapter(StatsDataAdapter());
    Hive.registerAdapter(TypesDataAdapter());
    Hive.registerAdapter(NameAndLinkDataAdapter());
    Hive.registerAdapter(EffectEntriesDataAdapter());
    await Boxes.initialBoxes();

    runApp( const MyAppLayout());
  }, (error, stack) {
    'error run myAppStarts: $error'.logger();
  });

}