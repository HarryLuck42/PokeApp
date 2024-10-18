import 'package:poke_app/core/memory/hive/box_keys.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';

import 'hive/boxes.dart';

class MemoryAction {
  final IMemoryAction memoryAction;

  MemoryAction(this.memoryAction);

  Future saveDetail(PokemonDetailData detail) async {
    await memoryAction.saveDetail(detail);
  }

  Future deleteDetail(PokemonDetailData detail) async {
    await memoryAction.deleteDetail(detail);
  }

  List<PokemonDetailData> getPokemon() {
    return memoryAction.getPokemon();
  }

  Future saveAbility(EffectEntriesData data) async {
    await memoryAction.saveAbility(data);
  }

  List<EffectEntriesData> getAbilities() {
    return memoryAction.getAbilities();
  }
}

abstract class IMemoryAction {
  Future saveDetail(PokemonDetailData detail);

  Future deleteDetail(PokemonDetailData detail);

  List<PokemonDetailData> getPokemon();

  Future saveAbility(EffectEntriesData data);

  List<EffectEntriesData> getAbilities();
}

class HiveMemoryAction implements IMemoryAction {
  @override
  Future deleteDetail(PokemonDetailData pokemon) async {
    final box = Boxes.getBox<PokemonDetailData>(BoxKeys.pokemon);
    final Map<dynamic, PokemonDetailData> map = box.toMap();
    dynamic targetKey;
    map.forEach((key, value) {
      if (value.id == pokemon.id) {
        targetKey = key;
      }
    });
    await box.delete(targetKey);
  }

  @override
  List<PokemonDetailData> getPokemon() {
    return Boxes.getBox<PokemonDetailData>(BoxKeys.pokemon).values.toList();
  }

  @override
  Future saveDetail(PokemonDetailData detail) async {
    if (!getPokemon().contains(detail)) {
      await Boxes.getBox<PokemonDetailData>(BoxKeys.pokemon).add(detail);
    }
  }

  @override
  List<EffectEntriesData> getAbilities() {
    return Boxes.getBox<EffectEntriesData>(BoxKeys.ability).values.toList();
  }

  @override
  Future saveAbility(EffectEntriesData data) async {
    if (!getAbilities().contains(data)) {
      await Boxes.getBox<EffectEntriesData>(BoxKeys.ability).add(data);
    }
  }
}
