import 'package:json_annotation/json_annotation.dart';
import 'package:poke_app/model/local/pokemon_detail_data.dart';

part 'pokemon_ability_response.g.dart';

@JsonSerializable()
class PokemonAbilityResponse {
  @JsonKey(name: "effect_changes")
  List<EffectChanges>? effectChanges;

  @JsonKey(name: "effect_entries")
  List<EffectEntries>? effectEntries;

  @JsonKey(name: "generation")
  NameAndLinkAbi? generation;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "is_main_series")
  bool? isMainSeries;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "names")
  List<Names>? names;

  @JsonKey(name: "pokemon")
  List<PokemonMonsters>? pokemonMonsters;

  PokemonAbilityResponse({
    this.effectChanges,
    this.effectEntries,
    this.generation,
    this.id,
    this.isMainSeries,
    this.name,
    this.names,
    this.pokemonMonsters,
  });

  factory PokemonAbilityResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityResponseToJson(this);

}

@JsonSerializable()
class EffectChanges {
  @JsonKey(name: "effect_entries")
  List<EffectEntries>? effectEntries;

  @JsonKey(name: "version_group")
  NameAndLinkAbi? versionGroup;

  EffectChanges({this.effectEntries, this.versionGroup});

  factory EffectChanges.fromJson(Map<String, dynamic> json) =>
      _$EffectChangesFromJson(json);

  Map<String, dynamic> toJson() => _$EffectChangesToJson(this);
}

@JsonSerializable()
class NameAndLinkAbi {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "url")
  String? url;

  NameAndLinkAbi({
    this.name,
    this.url,
  });

  factory NameAndLinkAbi.fromJson(Map<String, dynamic> json) =>
      _$NameAndLinkAbiFromJson(json);

  Map<String, dynamic> toJson() => _$NameAndLinkAbiToJson(this);

  NameAndLinkData convert() => NameAndLinkData(name: name, url: url);
}

@JsonSerializable()
class EffectEntries {
  @JsonKey(name: "effect")
  String? effect;

  @JsonKey(name: "language")
  NameAndLinkAbi? language;

  @JsonKey(name: "short_effect")
  String? shortEffect;

  EffectEntries({
    this.effect,
    this.language,
    this.shortEffect,
  });

  factory EffectEntries.fromJson(Map<String, dynamic> json) =>
      _$EffectEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$EffectEntriesToJson(this);

  EffectEntriesData convert(String name) => EffectEntriesData(effect: effect, language: language?.convert(), shortEffect: shortEffect, name: name);
}

@JsonSerializable()
class Names {
  @JsonKey(name: "language")
  NameAndLinkAbi? language;

  @JsonKey(name: "name")
  String? name;

  Names({
    this.language,
    this.name,});

  factory Names.fromJson(Map<String, dynamic> json) =>
      _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}

@JsonSerializable()
class PokemonMonsters {
  @JsonKey(name: "is_hidden")
  bool? isHidden;

  @JsonKey(name: "pokemon")
  NameAndLinkAbi? pokemon;

  @JsonKey(name: "slot")
  int? slot;

  PokemonMonsters({
    this.isHidden,
    this.pokemon,
    this.slot,});

  factory PokemonMonsters.fromJson(Map<String, dynamic> json) =>
      _$PokemonMonstersFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMonstersToJson(this);
}
