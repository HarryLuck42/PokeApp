import 'package:hive/hive.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';

import 'box_keys.dart';

class Boxes{

  static Box<T> getBox<T>(String key) => Hive.box(key);

  static Future<void> initialBoxes()async{
    await Hive.openBox<PokemonDetailData>(BoxKeys.pokemon);
    await Hive.openBox<EffectEntriesData>(BoxKeys.ability);
  }

}