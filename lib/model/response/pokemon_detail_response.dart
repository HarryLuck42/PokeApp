import 'package:json_annotation/json_annotation.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';
import 'package:poke_app/model/response/pokemon_ability_response.dart';

part 'pokemon_detail_response.g.dart';

@JsonSerializable()
class PokemonDetailResponse {
  @JsonKey(name: "abilities")
  List<Abilities>? abilities;

  @JsonKey(name: "base_experience")
  int? baseExperience;

  @JsonKey(name: "cries")
  Cries? cries;

  @JsonKey(name: "forms")
  List<NameAndLink>? forms;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "held_items")
  List<HeldItems>? heldItems;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "is_default")
  bool? isDefault;

  @JsonKey(name: "location_area_encounters")
  String? locationAreaEncounters;

  @JsonKey(name: "moves")
  List<Moves>? moves;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "order")
  int? order;

  @JsonKey(name: "species")
  NameAndLink? species;

  @JsonKey(name: "sprites")
  Sprites? sprites;

  @JsonKey(name: "stats")
  List<Stats>? stats;

  @JsonKey(name: "types")
  List<Types>? types;

  @JsonKey(name: "weight")
  int? weight;

  PokemonDetailResponse({
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
      this.weight,});

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailResponseToJson(this);

  PokemonDetailData convert(){
    return PokemonDetailData(
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

@JsonSerializable()
class Abilities {
  @JsonKey(name: "ability")
  NameAndLink? ability;

  @JsonKey(name: "is_hidden")
  bool? isHidden;

  @JsonKey(name: "slot")
  int? slot;

  Abilities({
    this.ability,
    this.isHidden,
    this.slot,});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);

  AbilitiesData convert(){
    return AbilitiesData(
      ability: ability?.convert(),
      isHidden: isHidden,
      slot: slot,
    );
  }
}

@JsonSerializable()
class Cries {
  @JsonKey(name: "latest")
  String? latest;

  @JsonKey(name: "legacy")
  String? legacy;

  Cries({
    this.latest,
    this.legacy,});

  factory Cries.fromJson(Map<String, dynamic> json) =>
      _$CriesFromJson(json);

  Map<String, dynamic> toJson() => _$CriesToJson(this);

  CriesData convert(){
    return CriesData(
      latest: latest,
      legacy: legacy,
    );
  }
}

@JsonSerializable()
class HeldItems {
  @JsonKey(name: "item")
  NameAndLink? item;

  @JsonKey(name: "version_details")
  List<VersionDetails>? versionDetails;

  HeldItems({this.item, this.versionDetails});

  factory HeldItems.fromJson(Map<String, dynamic> json) =>
      _$HeldItemsFromJson(json);

  Map<String, dynamic> toJson() => _$HeldItemsToJson(this);

  HeldItemsData convert(){
    return HeldItemsData(
      item: item?.convert(),
      versionDetails: versionDetails?.map((e) => e.convert()).toList(),
    );
  }
}

@JsonSerializable()
class VersionDetails {
  @JsonKey(name: "rarity")
  int? rarity;

  @JsonKey(name: "version")
  NameAndLink? version;

  VersionDetails({
    this.rarity,
    this.version,});

  factory VersionDetails.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDetailsToJson(this);

  VersionDetailsData convert(){
    return VersionDetailsData(
      rarity: rarity,
      version: version?.convert(),
    );
  }
}

@JsonSerializable()
class Moves {
  @JsonKey(name: "move")
  NameAndLink? move;

  Moves({
    this.move,});

  factory Moves.fromJson(Map<String, dynamic> json) =>
      _$MovesFromJson(json);

  Map<String, dynamic> toJson() => _$MovesToJson(this);

  MovesData convert(){
    return MovesData(move: move?.convert());
  }
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: "back_default")
  String? backDefault;

  @JsonKey(name: "back_female")
  String? backFemale;

  @JsonKey(name: "back_shiny")
  String? backShiny;

  @JsonKey(name: "back_shiny_female")
  String? backShinyFemale;

  @JsonKey(name: "front_default")
  String? frontDefault;

  @JsonKey(name: "front_female")
  String? frontFemale;

  @JsonKey(name: "front_shiny")
  String? frontShiny;

  @JsonKey(name: "front_shiny_female")
  String? frontShinyFemale;

  @JsonKey(name: "other")
  Other? other;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);

  SpritesData convert(){
    return SpritesData(
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

@JsonSerializable()
class Other {
  @JsonKey(name: "dream_world")
  DreamWorld? dreamWorld;

  @JsonKey(name: "home")
  Home? home;

  @JsonKey(name: "official-artwork")
  OfficialArtwork? officialartwork;

  @JsonKey(name: "showdown")
  Showdown? showdown;

  Other({
    this.dreamWorld,
    this.home,
    this.officialartwork,
    this.showdown,});

  factory Other.fromJson(Map<String, dynamic> json) =>
      _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);

  OtherData convert(){
    return OtherData(
      dreamWorld: dreamWorld?.convert(),
      home: home?.convert(),
      officialartwork: officialartwork?.convert(),
      showdown: showdown?.convert(),
    );
  }
}

@JsonSerializable()
class DreamWorld {
  @JsonKey(name: "front_default")
  String? frontDefault;

  @JsonKey(name: "front_female")
  String? frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,});

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);

  DreamWorldData convert(){
    return DreamWorldData(
      frontDefault: frontDefault,
      frontFemale: frontFemale,
    );
  }
}

@JsonSerializable()
class Home {
  @JsonKey(name: "front_default")
  String? frontDefault;

  @JsonKey(name: "front_female")
  String? frontFemale;

  @JsonKey(name: "front_shiny")
  String? frontShiny;

  @JsonKey(name: "front_shiny_female")
  String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,});

  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);

  HomeData convert() {
    return HomeData(
      frontDefault: frontDefault,
      frontFemale: frontFemale,
      frontShiny: frontShiny,
      frontShinyFemale: frontShinyFemale,
    );
  }
}

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: "front_default")
  String? frontDefault;

  @JsonKey(name: "front_shiny")
  String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);

  OfficialArtworkData convert() {
    return OfficialArtworkData(
      frontDefault: frontDefault,
      frontShiny: frontShiny,
    );
  }
}

@JsonSerializable()
class Showdown {
  @JsonKey(name: "back_default")
  String? backDefault;

  @JsonKey(name: "back_female")
  String? backFemale;

  @JsonKey(name: "back_shiny")
  String? backShiny;

  @JsonKey(name: "back_shiny_female")
  String? backShinyFemale;

  @JsonKey(name: "front_default")
  String? frontDefault;

  @JsonKey(name: "front_female")
  String? frontFemale;

  @JsonKey(name: "front_shiny")
  String? frontShiny;

  @JsonKey(name: "front_shiny_female")
  String? frontShinyFemale;

  Showdown({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,});

  factory Showdown.fromJson(Map<String, dynamic> json) =>
      _$ShowdownFromJson(json);

  Map<String, dynamic> toJson() => _$ShowdownToJson(this);

  ShowdownData convert() {
    return ShowdownData(
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

@JsonSerializable()
class Stats {
  @JsonKey(name: "base_stat")
  int? baseStat;

  @JsonKey(name: "effort")
  int? effort;

  @JsonKey(name: "stat")
  NameAndLink? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,});

  factory Stats.fromJson(Map<String, dynamic> json) =>
      _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);

  StatsData convert() {
    return StatsData(baseStat: baseStat, effort: effort, stat: stat?.convert());
  }
}

@JsonSerializable()
class Types {
  @JsonKey(name: "slot")
  int? slot;

  @JsonKey(name: "type")
  NameAndLink? type;

  Types({
    this.slot,
    this.type,});

  factory Types.fromJson(Map<String, dynamic> json) =>
      _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);

  TypesData convert() {
    return TypesData(slot: slot, type: type?.convert());
  }
}

@JsonSerializable()
class NameAndLink {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "url")
  String? url;

  NameAndLink({
    this.name,
    this.url,
  });

  factory NameAndLink.fromJson(Map<String, dynamic> json) =>
      _$NameAndLinkFromJson(json);

  Map<String, dynamic> toJson() => _$NameAndLinkToJson(this);

  NameAndLinkData convert() {
    return NameAndLinkData(name: name, url: url);
  }

  NameAndLinkAbi convertAbi() {
    return NameAndLinkAbi(name: name, url: url);
  }
}