import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';
import 'package:javanese_date_converter/javanese_date/wetonan.dart';

void main() {
  group('Should return a valid wetonan', () {
    test('Should return a valid day neptu', () {
      expect(Wetonan(JavaneseDate(day: 21, month: 4, year: 1879)).dayNeptu, 4);
      expect(Wetonan(JavaneseDate(day: 17, month: 9, year: 1904)).dayNeptu, 9);
    });
    test('Should return a valid pasaran neptu', () {
      expect(Wetonan(JavaneseDate(day: 21, month: 4, year: 1879)).pasaranNeptu, 9);
      expect(Wetonan(JavaneseDate(day: 17, month: 9, year: 1904)).pasaranNeptu, 9);
    });
  });
}