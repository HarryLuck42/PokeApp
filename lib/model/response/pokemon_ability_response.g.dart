// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbilityResponse _$PokemonAbilityResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonAbilityResponse(
      effectChanges: (json['effect_changes'] as List<dynamic>?)
          ?.map((e) => EffectChanges.fromJson(e as Map<String, dynamic>))
          .toList(),
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => EffectEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: json['generation'] == null
          ? null
          : NameAndLinkAbi.fromJson(json['generation'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      isMainSeries: json['is_main_series'] as bool?,
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Names.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonMonsters: (json['pokemon'] as List<dynamic>?)
          ?.map((e) => PokemonMonsters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonAbilityResponseToJson(
        PokemonAbilityResponse instance) =>
    <String, dynamic>{
      'effect_changes': instance.effectChanges,
      'effect_entries': instance.effectEntries,
      'generation': instance.generation,
      'id': instance.id,
      'is_main_series': instance.isMainSeries,
      'name': instance.name,
      'names': instance.names,
      'pokemon': instance.pokemonMonsters,
    };

EffectChanges _$EffectChangesFromJson(Map<String, dynamic> json) =>
    EffectChanges(
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => EffectEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroup: json['version_group'] == null
          ? null
          : NameAndLinkAbi.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EffectChangesToJson(EffectChanges instance) =>
    <String, dynamic>{
      'effect_entries': instance.effectEntries,
      'version_group': instance.versionGroup,
    };

NameAndLinkAbi _$NameAndLinkAbiFromJson(Map<String, dynamic> json) =>
    NameAndLinkAbi(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NameAndLinkAbiToJson(NameAndLinkAbi instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

EffectEntries _$EffectEntriesFromJson(Map<String, dynamic> json) =>
    EffectEntries(
      effect: json['effect'] as String?,
      language: json['language'] == null
          ? null
          : NameAndLinkAbi.fromJson(json['language'] as Map<String, dynamic>),
      shortEffect: json['short_effect'] as String?,
    );

Map<String, dynamic> _$EffectEntriesToJson(EffectEntries instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'language': instance.language,
      'short_effect': instance.shortEffect,
    };

Names _$NamesFromJson(Map<String, dynamic> json) => Names(
      language: json['language'] == null
          ? null
          : NameAndLinkAbi.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };

PokemonMonsters _$PokemonMonstersFromJson(Map<String, dynamic> json) =>
    PokemonMonsters(
      isHidden: json['is_hidden'] as bool?,
      pokemon: json['pokemon'] == null
          ? null
          : NameAndLinkAbi.fromJson(json['pokemon'] as Map<String, dynamic>),
      slot: (json['slot'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PokemonMonstersToJson(PokemonMonsters instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'pokemon': instance.pokemon,
      'slot': instance.slot,
    };
