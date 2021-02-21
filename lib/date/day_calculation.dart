import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/date/formula_init.dart';

class DayCalculation {
  static int calculateCentury(int year) => year ~/ 100;

  static int calculateDay(Date date) {
    final FormulaInit fx = FormulaInit(date);
    return (fx.k + ((13 * (fx.m + 1) ~/ 5)) + fx.y + (fx.y ~/ 4) + (fx.c ~/ 4) - (2 * fx.c)) % 7;
  }

  static int calculateTwoDigitYear(int year, int century) => year - (century * 100);
}
