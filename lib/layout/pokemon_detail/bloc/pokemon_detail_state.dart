part of 'pokemon_detail_bloc.dart';

enum PokemonDetailStatus { initial, success, error, loading, noConnection }

extension PokemonDetailStatusX on PokemonDetailStatus {
  bool get isInitial => this == PokemonDetailStatus.initial;

  bool get isSuccess => this == PokemonDetailStatus.success;

  bool get isError => this == PokemonDetailStatus.error;

  bool get isLoading => this == PokemonDetailStatus.loading;

  bool get isNoConnection => this == PokemonDetailStatus.noConnection;
}

class PokemonDetailState extends Equatable {
  final PokemonDetailResponse? detail;
  final PokemonDetailStatus status;
  final List<EffectEntriesData> ability;
  final String? error;

  const PokemonDetailState(
      {this.detail,
      this.status = PokemonDetailStatus.initial,
      this.ability = const [],
      this.error = ""});

  @override
  List<Object?> get props => [detail, ability, status, error];

  PokemonDetailState copyWith(
      {PokemonDetailResponse? detail,
      PokemonDetailStatus? status,
      List<EffectEntriesData>? ability,
      String? error}) {
    return PokemonDetailState(
        detail: detail ?? this.detail,
        status: status ?? this.status,
        ability: ability ?? this.ability,
        error: error ?? this.error);
  }
}
