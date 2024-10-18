import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';

import '../../../model/custom_data_set.dart';
import '../../../model/response/pokemon_detail_response.dart';

class PokemonBarChart extends StatelessWidget {
  final PokemonDetailResponse first;
  final PokemonDetailResponse second;

  const PokemonBarChart({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth() * 0.95,
      height: context.getHeight() * 0.5,
      child: BarChart(
        BarChartData(
          maxY: 150,
          minY: 0,
          alignment: BarChartAlignment.spaceEvenly,
          titlesData: FlTitlesData(
              show: true,
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              )),
          barGroups: List.generate(
            pokemonDataSetList().length,
            (i) {
              return BarChartGroupData(
                x: i,
                barRods: List.generate(pokemonDataSetList()[i].values.length,
                    (index) {
                  final isFirst = index == 0;
                  return BarChartRodData(
                      toY: pokemonDataSetList()[i].values[index],
                      color: isFirst ? Colors.red : Colors.blue);
                }),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['HP', 'Atk', 'Def', 'Spd', 'Sp Atk', 'Sp Def'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
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
      CustomDataSet(values: [
        firstHP?.baseStat?.toDouble() ?? 0,
        secondHP?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(values: [
        firstAttack?.baseStat?.toDouble() ?? 0,
        secondAttack?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(values: [
        firstDefense?.baseStat?.toDouble() ?? 0,
        secondDefense?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(values: [
        firstSpeed?.baseStat?.toDouble() ?? 0,
        secondSpeed?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(values: [
        firstSpecialAttack?.baseStat?.toDouble() ?? 0,
        secondSpecialAttack?.baseStat?.toDouble() ?? 0,
      ]),
      CustomDataSet(values: [
        firstSpecialDefense?.baseStat?.toDouble() ?? 0,
        secondSpecialDefense?.baseStat?.toDouble() ?? 0,
      ]),
    ];
  }
}
