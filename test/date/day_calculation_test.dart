import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/date/day_calculation.dart';

void main() {
  group('Should return correct day calculation', () {
    test('Should return correct century', () {
      expect(DayCalculation.calculateCentury(1999), 19);
      expect(DayCalculation.calculateCentury(2000), 20);
    });
    test('Should return correct day value', () {
      expect(DayCalculation.calculateDay(Date(day: 21, month: 4, year: 1879)), 2);
      expect(DayCalculation.calculateDay(Date(day: 17, month: 9, year: 1904)), 0);
    });
    test('Should return last two digit of year', () {
      expect(DayCalculation.calculateTwoDigitYear(1999, 19), 99);
      expect(DayCalculation.calculateTwoDigitYear(2000, 20), 0);
    });
  });
}