import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/src/utils/lerp.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';

import '../../../model/custom_data_set.dart';

class PokemonRadarChart extends StatelessWidget {
  final PokemonDetailResponse first;
  final PokemonDetailResponse second;

  const PokemonRadarChart(
      {super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["HP", lang(context).attack ?? "Attack", lang(context).defense ?? "Defence", lang(context).speed ?? "Speed", lang(context).specialAttack ?? "Special Attack", lang(context).specialDefense ?? "Special Defence"];
    return SizedBox(
      width: double.infinity,
      height: context.getHeight() * 0.5,
      child: RadarChart(
          RadarChartDataFixMinMax(
            radarShape: RadarShape.polygon,
            dataSets: _displayDataSets(),
            radarBorderData:
            BorderSide(color: context.getColorScheme().outlineVariant),
            tickCount: 6,
            ticksTextStyle: const TextStyle(color: Colors.transparent),
            tickBorderData:
            BorderSide(color: context.getColorScheme().outlineVariant),
            gridBorderData: const BorderSide(color: Colors.transparent),
            getTitle: (index, _) => RadarChartTitle(text: titles[index], positionPercentageOffset: 0),
            max: const RadarEntry(value: 150)
          )
      ),
    );
  }

  List<CustomDataSet> pokemonDataSetList() {
    final firstHP = first.stats?.where((e) => e.stat?.name == "hp").first;
    final firstAttack =
        first.stats?.where((e) => e.stat?.name == "attack").first;
    final firstDefense =
        first.stats?.where((e) => e.stat?.name == "defense").first;
    final firstSpecialAttack =
        first.stats?.where((e) => e.stat?.name == "special-attack").first;
    final firstSpecialDefense =
        first.stats?.where((e) => e.stat?.name == "special-defense").first;
    final firstSpeed = first.stats?.where((e) => e.stat?.name == "speed").first;
    final secondHP = second.stats?.where((e) => e.stat?.name == "hp").first;
    final secondAttack =
        second.stats?.where((e) => e.stat?.name == "attack").first;
    final secondDefense =
        second.stats?.where((e) => e.stat?.name == "defense").first;
    final secondSpecialAttack =
        second.stats?.where((e) => e.stat?.name == "special-attack").first;
    final secondSpecialDefense =
        second.stats?.where((e) => e.stat?.name == "special-defense").first;
    final secondSpeed =
        second.stats?.where((e) => e.stat?.name == "speed").first;
    return [
      CustomDataSet(color: Colors.red, values: [
        firstHP?.baseStat?.toDouble() ?? 0,
        firstAttack?.baseStat?.toDouble() ?? 0,
        firstDefense?.baseStat?.toDouble() ?? 0,
        firstSpeed?.baseStat?.toDouble() ?? 0,
        firstSpecialAttack?.baseStat?.toDouble() ?? 0,
        firstSpecialDefense?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(color: Colors.blue, values: [
        secondHP?.baseStat?.toDouble() ?? 0,
        secondAttack?.baseStat?.toDouble() ?? 0,
        secondDefense?.baseStat?.toDouble() ?? 0,
        secondSpeed?.baseStat?.toDouble() ?? 0,
        secondSpecialAttack?.baseStat?.toDouble() ?? 0,
        secondSpecialDefense?.baseStat?.toDouble() ?? 0,
      ]),
    ];
  }

  List<RadarDataSet> _displayDataSets() {
    return pokemonDataSetList().map((data) {
      final List<RadarEntry> dataEntries =
          data.values.map((value) => RadarEntry(value: value)).toList();

      return RadarDataSet(dataEntries: dataEntries, fillColor: data.color?.withOpacity(0.2), borderColor: data.color, entryRadius: 2, borderWidth: 2.3,);
    }).toList();
  }
}

/// Allow maxEntry and minEntry values to be specified with parameters
class RadarChartDataFixMinMax extends RadarChartData {
  RadarChartDataFixMinMax(
      {required super.dataSets,
        super.radarBackgroundColor,
        super.radarBorderData,
        super.radarShape,
        super.getTitle,
        super.titleTextStyle,
        super.titlePositionPercentageOffset,
        super.tickCount,
        super.ticksTextStyle,
        super.tickBorderData,
        super.gridBorderData,
        super.radarTouchData,
        super.borderData,
        this.max,
        this.min});

  final RadarEntry? max;

  final RadarEntry? min;

  @override
  RadarEntry get maxEntry => max ?? super.maxEntry;

  @override
  RadarEntry get minEntry => min ?? super.minEntry;

  @override
  RadarChartData copyWith(
      {List<RadarDataSet>? dataSets,
        Color? radarBackgroundColor,
        BorderSide? radarBorderData,
        RadarShape? radarShape,
        GetTitleByIndexFunction? getTitle,
        TextStyle? titleTextStyle,
        double? titlePositionPercentageOffset,
        int? tickCount,
        TextStyle? ticksTextStyle,
        BorderSide? tickBorderData,
        BorderSide? gridBorderData,
        RadarTouchData? radarTouchData,
        FlBorderData? borderData,
        RadarEntry? max,
        RadarEntry? min}) {
    return RadarChartDataFixMinMax(
      dataSets: dataSets ?? this.dataSets,
      radarBackgroundColor: radarBackgroundColor ?? this.radarBackgroundColor,
      radarBorderData: radarBorderData ?? this.radarBorderData,
      radarShape: radarShape ?? this.radarShape,
      getTitle: getTitle ?? this.getTitle,
      titleTextStyle: titleTextStyle ?? this.ticksTextStyle,
      titlePositionPercentageOffset:
      titlePositionPercentageOffset ?? this.titlePositionPercentageOffset,
      tickCount: tickCount ?? this.tickCount,
      ticksTextStyle: ticksTextStyle ?? this.ticksTextStyle,
      tickBorderData: tickBorderData ?? this.tickBorderData,
      gridBorderData: gridBorderData ?? this.gridBorderData,
      radarTouchData: radarTouchData ?? this.radarTouchData,
      borderData: borderData ?? this.borderData,
      max: max ?? this.max,
      min: min ?? this.min,
    );
  }

  @override
  RadarChartData lerp(BaseChartData a, BaseChartData b, double t) {
    if (a is RadarChartDataFixMinMax && b is RadarChartDataFixMinMax) {
      return RadarChartDataFixMinMax(
        dataSets: lerpRadarDataSetList(a.dataSets, b.dataSets, t),
        radarBackgroundColor:
        Color.lerp(a.radarBackgroundColor, b.radarBackgroundColor, t),
        getTitle: b.getTitle,
        titleTextStyle: TextStyle.lerp(a.titleTextStyle, b.titleTextStyle, t),
        titlePositionPercentageOffset: lerpDouble(
          a.titlePositionPercentageOffset,
          b.titlePositionPercentageOffset,
          t,
        ),
        tickCount: lerpInt(a.tickCount, b.tickCount, t),
        ticksTextStyle: TextStyle.lerp(a.ticksTextStyle, b.ticksTextStyle, t),
        gridBorderData: BorderSide.lerp(a.gridBorderData, b.gridBorderData, t),
        radarBorderData:
        BorderSide.lerp(a.radarBorderData, b.radarBorderData, t),
        radarShape: b.radarShape,
        tickBorderData: BorderSide.lerp(a.tickBorderData, b.tickBorderData, t),
        borderData: FlBorderData.lerp(a.borderData, b.borderData, t),
        radarTouchData: b.radarTouchData,
        max: RadarEntry.lerp(a.maxEntry, b.maxEntry, t),
        min: RadarEntry.lerp(a.minEntry, b.minEntry, t),
      );
    } else {
      return super.lerp(a, b, t);
    }
  }
}
