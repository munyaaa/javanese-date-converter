import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/date/formula_init.dart';

void main() {
  group('Should return correct formula variable', () {
    FormulaInit fx = FormulaInit(Date(day: 21, month: 4, year: 1879));
    test('Should return correct k', () {
      expect(fx.k, 21);
    });
    test('Should return correct m', () {
      expect(fx.m, 4);
    });
    test('Should return correct c', () {
      expect(fx.c, 18);
    });
    test('Should return correct y', () {
      expect(fx.y, 79);
    });
  });
}