import 'dart:math';

import '../../base/dimension.dart';

abstract class MineNumberCalculator {
  int compute(Dimension dimension);
}

class MinesNumberByPercentage implements MineNumberCalculator {
  static const minValue = 10.0, maxValue = 80.0;

  late double _value;

  MinesNumberByPercentage(double value) {
    assert(_isValueValid(value), '$value should be between $minValue and $max');
    _value = value;
  }

  bool _isValueValid(double value) => (value >= minValue) && (value <= maxValue);

  @override
  int compute(Dimension dimension) {
    return ((_value / 100) * dimension.size).floor();
  }
}
