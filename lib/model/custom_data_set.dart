import 'dart:ui';

class CustomDataSet {
  CustomDataSet({
    this.color,
    required this.values,
  });

  final Color? color;
  final List<double> values;
}