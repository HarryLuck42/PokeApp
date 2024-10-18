import 'package:hive/hive.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

import '../response/pokemon_ability_response.dart';

part 'pokemon_detail_data.g.dart';

@HiveType(typeId: 0)
class PokemonDetailData extends HiveObject {
  @HiveField(0)
  List<AbilitiesData>? abilities;

  @HiveField(1)
  int? baseExperience;

  @HiveField(2)
  CriesData? cries;

  @HiveField(3)
  List<NameAndLinkData>? forms;

  @HiveField(4)
  int? height;

  @HiveField(5)
  List<HeldItemsData>? heldItems;

  @HiveField(6)
  int? id;

  @HiveField(7)
  bool? isDefault;

  @HiveField(8)
  String? locationAreaEncounters;

  @HiveField(9)
  List<MovesData>? moves;

  @HiveField(10)
  String? name;

  @HiveField(11)
  int? order;

  @HiveField(12)
  NameAndLinkData? species;

  @HiveField(13)
  SpritesData? sprites;

  @HiveField(14)
  List<StatsData>? stats;

  @HiveField(15)
  List<TypesData>? types;

  @HiveField(16)
  int? weight;

  PokemonDetailData({
    this.abilities,
    this.baseExperience,
    this.cries,
    this.forms,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDetailData.fromJson(Map<String, dynamic> json) {
    abilities = json['abilities'];
    baseExperience = json['baseExperience'];
    cries = json['cries'];
    forms = json['forms'];
    height = json['height'];
    heldItems = json['heldItems'];
    id = json['id'];
    isDefault = json['isDefault'];
    locationAreaEncounters = json['locationAreaEncounters'];
    moves = json['moves'];
    name = json['name'];
    order = json['order'];
    species = json['species'];
    sprites = json['sprites'];
    stats = json['stats'];
    types = json['types'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['abilities'] = abilities;
    result['baseExperience'] = baseExperience;
    result['cries'] = cries;
    result['forms'] = forms;
    result['height'] = height;
    result['heldItems'] = heldItems;
    result['id'] = id;
    result['isDefault'] = isDefault;
    result['locationAreaEncounters'] = locationAreaEncounters;
    result['moves'] = moves;
    result['name'] = name;
    result['order'] = order;
    result['species'] = species;
    result['sprites'] = sprites;
    result['stats'] = stats;
    result['types'] = types;
    result['weight'] = weight;
    return result;
  }

  PokemonDetailResponse convert(){
    return PokemonDetailResponse(
      abilities: abilities?.map((e) => e.convert()).toList(),
      baseExperience: baseExperience,
      cries: cries?.convert(),
      forms: forms?.map((e) => e.convert()).toList(),
      height: height,
      heldItems: heldItems?.map((e) => e.convert()).toList(),
      id: id,
      isDefault: isDefault,
      locationAreaEncounters: locationAreaEncounters,
      moves: moves?.map((e) => e.convert()).toList(),
      name: name,
      order: order,
      species: species?.convert(),
      sprites: sprites?.convert(),
      stats: stats?.map((e) => e.convert()).toList(),
      types: types?.map((e) => e.convert()).toList(),
      weight: weight,
    );
  }
}

@HiveType(typeId: 1)
class AbilitiesData extends HiveObject {
  @HiveField(0)
  NameAndLinkData? ability;

  @HiveField(1)
  bool? isHidden;

  @HiveField(2)
  int? slot;

  AbilitiesData({
    this.ability,
    this.isHidden,
    this.slot,
  });

  AbilitiesData.fromJson(Map<String, dynamic> json) {
    ability = json['ability'];
    isHidden = json['isHidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['ability'] = ability;
    result['isHidden'] = isHidden;
    result['slot'] = slot;
    return result;
  }

  Abilities convert(){
    return Abilities(
      ability: ability?.convert(),
      isHidden: isHidden,
      slot: slot,
    );
  }
}

@HiveType(typeId: 2)
class CriesData extends HiveObject {
  @HiveField(0)
  String? latest;

  @HiveField(1)
  String? legacy;

  CriesData({
    this.latest,
    this.legacy,
  });

  CriesData.fromJson(Map<String, dynamic> json) {
    latest = json['latest'];
    legacy = json['legacy'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['latest'] = latest;
    result['legacy'] = legacy;
    return result;
  }

  Cries convert(){
    return Cries(
      latest: latest,
      legacy: legacy,
    );
  }
}

@HiveType(typeId: 3)
class HeldItemsData extends HiveObject {
  @HiveField(0)
  NameAndLinkData? item;

  @HiveField(1)
  List<VersionDetailsData>? versionDetails;

  HeldItemsData({this.item, this.versionDetails});

  HeldItemsData.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    versionDetails = json['versionDetails'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['item'] = item;
    result['versionDetails'] = versionDetails;
    return result;
  }

  HeldItems convert(){
    return HeldItems(
      item: item?.convert(),
      versionDetails: versionDetails?.map((e) => e.convert()).toList(),
    );
  }
}

@HiveType(typeId: 4)
class VersionDetailsData extends HiveObject {
  @HiveField(0)
  int? rarity;

  @HiveField(1)
  NameAndLinkData? version;

  VersionDetailsData({
    this.rarity,
    this.version,
  });

  VersionDetailsData.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['rarity'] = rarity;
    result['version'] = version;
    return result;
  }

  VersionDetails convert(){
    return VersionDetails(
      rarity: rarity,
      version: version?.convert(),
    );
  }
}

@HiveType(typeId: 5)
class MovesData extends HiveObject {
  @HiveField(0)
  NameAndLinkData? move;

  MovesData({
    this.move,
  });

  MovesData.fromJson(Map<String, dynamic> json) {
    move = json['move'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['move'] = move;
    return result;
  }

  Moves convert(){
    return Moves(move: move?.convert());
  }
}

@HiveType(typeId: 6)
class SpritesData extends HiveObject {
  @HiveField(0)
  String? backDefault;

  @HiveField(1)
  String? backFemale;

  @HiveField(2)
  String? backShiny;

  @HiveField(3)
  String? backShinyFemale;

  @HiveField(4)
  String? frontDefault;

  @HiveField(5)
  String? frontFemale;

  @HiveField(6)
  String? frontShiny;

  @HiveField(7)
  String? frontShinyFemale;

  @HiveField(8)
  OtherData? other;

  SpritesData({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  SpritesData.fromJson(Map<String, dynamic> json) {
    backDefault = json['backDefault'];
    backFemale = json['backFemale'];
    backShiny = json['backShiny'];
    backShinyFemale = json['backShinyFemale'];
    frontDefault = json['frontDefault'];
    frontFemale = json['frontFemale'];
    frontShiny = json['frontShiny'];
    frontShinyFemale = json['frontShinyFemale'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['backDefault'] = backDefault;
    result['backFemale'] = backFemale;
    result['backShiny'] = backShiny;
    result['backShinyFemale'] = backShinyFemale;
    result['frontDefault'] = frontDefault;
    result['frontFemale'] = frontFemale;
    result['frontShiny'] = frontShiny;
    result['frontShinyFemale'] = frontShinyFemale;
    result['other'] = other;
    return result;
  }

  Sprites convert(){
    return Sprites(
      backDefault: backDefault,
      backFemale: backFemale,
      backShiny: backShiny,
      backShinyFemale: backShinyFemale,
      frontDefault: frontDefault,
      frontFemale: frontFemale,
      frontShiny: frontShiny,
      frontShinyFemale: frontShinyFemale,
      other: other?.convert()
    );
  }
}

@HiveType(typeId: 7)
class OtherData extends HiveObject {
  @HiveField(0)
  DreamWorldData? dreamWorld;

  @HiveField(1)
  HomeData? home;

  @HiveField(2)
  OfficialArtworkData? officialartwork;

  @HiveField(3)
  ShowdownData? showdown;

  OtherData({
    this.dreamWorld,
    this.home,
    this.officialartwork,
    this.showdown,
  });

  OtherData.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dreamWorld'];
    home = json['home'];
    officialartwork = json['officialartwork'];
    showdown = json['showdown'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['dreamWorld'] = dreamWorld;
    result['home'] = home;
    result['officialartwork'] = officialartwork;
    result['showdown'] = showdown;
    return result;
  }

  Other convert(){
    return Other(
      dreamWorld: dreamWorld?.convert(),
      home: home?.convert(),
      officialartwork: officialartwork?.convert(),
      showdown: showdown?.convert(),
    );
  }
}

@HiveType(typeId: 8)
class DreamWorldData extends HiveObject {
  @HiveField(0)
  String? frontDefault;

  @HiveField(1)
  String? frontFemale;

  DreamWorldData({
    this.frontDefault,
    this.frontFemale,
  });

  DreamWorldData.fromJson(Map<String, dynamic> json) {
    frontDefault = json['frontDefault'];
    frontFemale = json['frontFemale'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['frontDefault'] = frontDefault;
    result['frontFemale'] = frontFemale;
    return result;
  }

  DreamWorld convert(){
    return DreamWorld(
      frontDefault: frontDefault,
      frontFemale: frontFemale,
    );
  }
}

@HiveType(typeId: 9)
class HomeData extends HiveObject {
  @HiveField(0)
  String? frontDefault;

  @HiveField(1)
  String? frontFemale;

  @HiveField(2)
  String? frontShiny;

  @HiveField(3)
  String? frontShinyFemale;

  HomeData({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    frontDefault = json['frontDefault'];
    frontFemale = json['frontFemale'];
    frontShiny = json['frontShiny'];
    frontShinyFemale = json['frontShinyFemale'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['frontDefault'] = frontDefault;
    result['frontFemale'] = frontFemale;
    result['frontShiny'] = frontShiny;
    result['frontShinyFemale'] = frontShinyFemale;
    return result;
  }

  Home convert() {
    return Home(
      frontDefault: frontDefault,
      frontFemale: frontFemale,
      frontShiny: frontShiny,
      frontShinyFemale: frontShinyFemale,
    );
  }
}

@HiveType(typeId: 10)
class OfficialArtworkData extends HiveObject {
  @HiveField(0)
  String? frontDefault;

  @HiveField(1)
  String? frontShiny;

  OfficialArtworkData({
    this.frontDefault,
    this.frontShiny,
  });

  OfficialArtworkData.fromJson(Map<String, dynamic> json) {
    frontDefault = json['frontDefault'];
    frontShiny = json['frontShiny'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['frontDefault'] = frontDefault;
    result['frontShiny'] = frontShiny;
    return result;
  }

  OfficialArtwork convert() {
    return OfficialArtwork(
      frontDefault: frontDefault,
      frontShiny: frontShiny,
    );
  }
}

@HiveType(typeId: 11)
class ShowdownData extends HiveObject {
  @HiveField(0)
  String? backDefault;

  @HiveField(1)
  String? backFemale;

  @HiveField(2)
  String? backShiny;

  @HiveField(3)
  String? backShinyFemale;

  @HiveField(4)
  String? frontDefault;

  @HiveField(5)
  String? frontFemale;

  @HiveField(6)
  String? frontShiny;

  @HiveField(7)
  String? frontShinyFemale;

  ShowdownData({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  ShowdownData.fromJson(Map<String, dynamic> json) {
    backDefault = json['backDefault'];
    backFemale = json['backFemale'];
    backShiny = json['backShiny'];
    backShinyFemale = json['backShinyFemale'];
    frontDefault = json['frontDefault'];
    frontFemale = json['frontFemale'];
    frontShiny = json['frontShiny'];
    frontShinyFemale = json['frontShinyFemale'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['backDefault'] = backDefault;
    result['backFemale'] = backFemale;
    result['backShiny'] = backShiny;
    result['backShinyFemale'] = backShinyFemale;
    result['frontDefault'] = frontDefault;
    result['frontFemale'] = frontFemale;
    result['frontShiny'] = frontShiny;
    result['frontShinyFemale'] = frontShinyFemale;
    return result;
  }

  Showdown convert() {
    return Showdown(
      backDefault: backDefault,
      backFemale: backFemale,
      backShiny: backShiny,
      backShinyFemale: backShinyFemale,
      frontDefault: frontDefault,
      frontFemale: frontFemale,
      frontShiny: frontShiny,
      frontShinyFemale: frontShinyFemale,
    );
  }
}

@HiveType(typeId: 12)
class StatsData extends HiveObject {
  @HiveField(0)
  int? baseStat;

  @HiveField(1)
  int? effort;

  @HiveField(2)
  NameAndLinkData? stat;

  StatsData({
    this.baseStat,
    this.effort,
    this.stat,
  });

  StatsData.fromJson(Map<String, dynamic> json) {
    baseStat = json['baseStat'];
    effort = json['effort'];
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['baseStat'] = baseStat;
    result['effort'] = effort;
    result['stat'] = stat;
    return result;
  }

  Stats convert() {
    return Stats(baseStat: baseStat, effort: effort, stat: stat?.convert());
  }
}

@HiveType(typeId: 13)
class TypesData extends HiveObject {
  @HiveField(0)
  int? slot;

  @HiveField(1)
  NameAndLinkData? type;

  TypesData({
    this.slot,
    this.type,
  });

  TypesData.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['slot'] = slot;
    result['type'] = type;
    return result;
  }

  Types convert() {
    return Types(slot: slot, type: type?.convert());
  }
}

@HiveType(typeId: 14)
class NameAndLinkData extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  NameAndLinkData({
    this.name,
    this.url,
  });

  NameAndLinkData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['name'] = name;
    result['url'] = url;
    return result;
  }

  NameAndLink convert() {
    return NameAndLink(name: name, url: url);
  }

  NameAndLinkAbi convertAbi() {
    return NameAndLinkAbi(name: name, url: url);
  }
}

@HiveType(typeId: 15)
class EffectEntriesData extends HiveObject  {

  @HiveField(0)
  String? effect;

  @HiveField(1)
  NameAndLinkData? language;

  @HiveField(2)
  String? shortEffect;

  @HiveField(3)
  String? name;

  EffectEntriesData({
    this.effect,
    this.language,
    this.shortEffect,
  this.name,});

  EffectEntriesData.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'];
    shortEffect = json['shortEffect'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['effect'] = effect;
    result['language'] = language;
    result['shortEffect'] = shortEffect;
    result['name'] = name;
    return result;
  }

  EffectEntries convert() {
    return EffectEntries(effect: effect, language: language?.convertAbi(), shortEffect: shortEffect);
  }
}
