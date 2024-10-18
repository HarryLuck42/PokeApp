// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonDetailDataAdapter extends TypeAdapter<PokemonDetailData> {
  @override
  final int typeId = 0;

  @override
  PokemonDetailData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonDetailData(
      abilities: (fields[0] as List?)?.cast<AbilitiesData>(),
      baseExperience: fields[1] as int?,
      cries: fields[2] as CriesData?,
      forms: (fields[3] as List?)?.cast<NameAndLinkData>(),
      height: fields[4] as int?,
      heldItems: (fields[5] as List?)?.cast<HeldItemsData>(),
      id: fields[6] as int?,
      isDefault: fields[7] as bool?,
      locationAreaEncounters: fields[8] as String?,
      moves: (fields[9] as List?)?.cast<MovesData>(),
      name: fields[10] as String?,
      order: fields[11] as int?,
      species: fields[12] as NameAndLinkData?,
      sprites: fields[13] as SpritesData?,
      stats: (fields[14] as List?)?.cast<StatsData>(),
      types: (fields[15] as List?)?.cast<TypesData>(),
      weight: fields[16] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonDetailData obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.abilities)
      ..writeByte(1)
      ..write(obj.baseExperience)
      ..writeByte(2)
      ..write(obj.cries)
      ..writeByte(3)
      ..write(obj.forms)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.heldItems)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.isDefault)
      ..writeByte(8)
      ..write(obj.locationAreaEncounters)
      ..writeByte(9)
      ..write(obj.moves)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.species)
      ..writeByte(13)
      ..write(obj.sprites)
      ..writeByte(14)
      ..write(obj.stats)
      ..writeByte(15)
      ..write(obj.types)
      ..writeByte(16)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDetailDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AbilitiesDataAdapter extends TypeAdapter<AbilitiesData> {
  @override
  final int typeId = 1;

  @override
  AbilitiesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbilitiesData(
      ability: fields[0] as NameAndLinkData?,
      isHidden: fields[1] as bool?,
      slot: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AbilitiesData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ability)
      ..writeByte(1)
      ..write(obj.isHidden)
      ..writeByte(2)
      ..write(obj.slot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbilitiesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CriesDataAdapter extends TypeAdapter<CriesData> {
  @override
  final int typeId = 2;

  @override
  CriesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CriesData(
      latest: fields[0] as String?,
      legacy: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CriesData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latest)
      ..writeByte(1)
      ..write(obj.legacy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CriesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HeldItemsDataAdapter extends TypeAdapter<HeldItemsData> {
  @override
  final int typeId = 3;

  @override
  HeldItemsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HeldItemsData(
      item: fields[0] as NameAndLinkData?,
      versionDetails: (fields[1] as List?)?.cast<VersionDetailsData>(),
    );
  }

  @override
  void write(BinaryWriter writer, HeldItemsData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.versionDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeldItemsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VersionDetailsDataAdapter extends TypeAdapter<VersionDetailsData> {
  @override
  final int typeId = 4;

  @override
  VersionDetailsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VersionDetailsData(
      rarity: fields[0] as int?,
      version: fields[1] as NameAndLinkData?,
    );
  }

  @override
  void write(BinaryWriter writer, VersionDetailsData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rarity)
      ..writeByte(1)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionDetailsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovesDataAdapter extends TypeAdapter<MovesData> {
  @override
  final int typeId = 5;

  @override
  MovesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovesData(
      move: fields[0] as NameAndLinkData?,
    );
  }

  @override
  void write(BinaryWriter writer, MovesData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.move);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpritesDataAdapter extends TypeAdapter<SpritesData> {
  @override
  final int typeId = 6;

  @override
  SpritesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpritesData(
      backDefault: fields[0] as String?,
      backFemale: fields[1] as String?,
      backShiny: fields[2] as String?,
      backShinyFemale: fields[3] as String?,
      frontDefault: fields[4] as String?,
      frontFemale: fields[5] as String?,
      frontShiny: fields[6] as String?,
      frontShinyFemale: fields[7] as String?,
      other: fields[8] as OtherData?,
    );
  }

  @override
  void write(BinaryWriter writer, SpritesData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.backDefault)
      ..writeByte(1)
      ..write(obj.backFemale)
      ..writeByte(2)
      ..write(obj.backShiny)
      ..writeByte(3)
      ..write(obj.backShinyFemale)
      ..writeByte(4)
      ..write(obj.frontDefault)
      ..writeByte(5)
      ..write(obj.frontFemale)
      ..writeByte(6)
      ..write(obj.frontShiny)
      ..writeByte(7)
      ..write(obj.frontShinyFemale)
      ..writeByte(8)
      ..write(obj.other);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpritesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OtherDataAdapter extends TypeAdapter<OtherData> {
  @override
  final int typeId = 7;

  @override
  OtherData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OtherData(
      dreamWorld: fields[0] as DreamWorldData?,
      home: fields[1] as HomeData?,
      officialartwork: fields[2] as OfficialArtworkData?,
      showdown: fields[3] as ShowdownData?,
    );
  }

  @override
  void write(BinaryWriter writer, OtherData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dreamWorld)
      ..writeByte(1)
      ..write(obj.home)
      ..writeByte(2)
      ..write(obj.officialartwork)
      ..writeByte(3)
      ..write(obj.showdown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DreamWorldDataAdapter extends TypeAdapter<DreamWorldData> {
  @override
  final int typeId = 8;

  @override
  DreamWorldData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DreamWorldData(
      frontDefault: fields[0] as String?,
      frontFemale: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DreamWorldData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.frontDefault)
      ..writeByte(1)
      ..write(obj.frontFemale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DreamWorldDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HomeDataAdapter extends TypeAdapter<HomeData> {
  @override
  final int typeId = 9;

  @override
  HomeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeData(
      frontDefault: fields[0] as String?,
      frontFemale: fields[1] as String?,
      frontShiny: fields[2] as String?,
      frontShinyFemale: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.frontDefault)
      ..writeByte(1)
      ..write(obj.frontFemale)
      ..writeByte(2)
      ..write(obj.frontShiny)
      ..writeByte(3)
      ..write(obj.frontShinyFemale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfficialArtworkDataAdapter extends TypeAdapter<OfficialArtworkData> {
  @override
  final int typeId = 10;

  @override
  OfficialArtworkData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfficialArtworkData(
      frontDefault: fields[0] as String?,
      frontShiny: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OfficialArtworkData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.frontDefault)
      ..writeByte(1)
      ..write(obj.frontShiny);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfficialArtworkDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShowdownDataAdapter extends TypeAdapter<ShowdownData> {
  @override
  final int typeId = 11;

  @override
  ShowdownData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShowdownData(
      backDefault: fields[0] as String?,
      backFemale: fields[1] as String?,
      backShiny: fields[2] as String?,
      backShinyFemale: fields[3] as String?,
      frontDefault: fields[4] as String?,
      frontFemale: fields[5] as String?,
      frontShiny: fields[6] as String?,
      frontShinyFemale: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShowdownData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.backDefault)
      ..writeByte(1)
      ..write(obj.backFemale)
      ..writeByte(2)
      ..write(obj.backShiny)
      ..writeByte(3)
      ..write(obj.backShinyFemale)
      ..writeByte(4)
      ..write(obj.frontDefault)
      ..writeByte(5)
      ..write(obj.frontFemale)
      ..writeByte(6)
      ..write(obj.frontShiny)
      ..writeByte(7)
      ..write(obj.frontShinyFemale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowdownDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatsDataAdapter extends TypeAdapter<StatsData> {
  @override
  final int typeId = 12;

  @override
  StatsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatsData(
      baseStat: fields[0] as int?,
      effort: fields[1] as int?,
      stat: fields[2] as NameAndLinkData?,
    );
  }

  @override
  void write(BinaryWriter writer, StatsData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.baseStat)
      ..writeByte(1)
      ..write(obj.effort)
      ..writeByte(2)
      ..write(obj.stat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypesDataAdapter extends TypeAdapter<TypesData> {
  @override
  final int typeId = 13;

  @override
  TypesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypesData(
      slot: fields[0] as int?,
      type: fields[1] as NameAndLinkData?,
    );
  }

  @override
  void write(BinaryWriter writer, TypesData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.slot)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NameAndLinkDataAdapter extends TypeAdapter<NameAndLinkData> {
  @override
  final int typeId = 14;

  @override
  NameAndLinkData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameAndLinkData(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NameAndLinkData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameAndLinkDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EffectEntriesDataAdapter extends TypeAdapter<EffectEntriesData> {
  @override
  final int typeId = 15;

  @override
  EffectEntriesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EffectEntriesData(
      effect: fields[0] as String?,
      language: fields[1] as NameAndLinkData?,
      shortEffect: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EffectEntriesData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.effect)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.shortEffect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EffectEntriesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
