import 'package:json_annotation/json_annotation.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  @JsonKey(name: "count")
  int? count;

  @JsonKey(name: "next")
  String? next;

  @JsonKey(name: "previous")
  String? previous;

  @JsonKey(name: "results")
  List<Pokemon>? results;

  PokemonResponse({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);

}

@JsonSerializable()
class Pokemon {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "url")
  String? url;

  PokemonDetailResponse? detail;

  Pokemon({
    this.name,
    this.url,});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}