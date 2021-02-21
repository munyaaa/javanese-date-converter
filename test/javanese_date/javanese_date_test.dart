import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';

void main() {
  group('Should have a valid javanese date', () {
    test('Should can input the right object props', () {
      JavaneseDate javaneseDate = JavaneseDate(date: 31, month: 1, year: 1998);
      expect(javaneseDate.date, 31);
      expect(javaneseDate.month, 1);
      expect(javaneseDate.year, 1998);
    });
    test('Should return exception', () {
      expect(() {
        JavaneseDate _ = JavaneseDate(date: null, month: 2, year: 1998);
      }, throwsAssertionError);
      expect(() {
        JavaneseDate _ = JavaneseDate(date: 31, month: 2, year: 1998);
      }, throwsException);
    });
    test('Should return correct dinapitu', () {
      expect(JavaneseDate(date: 21, month: 4, year: 1879).dinapitu, "Sênèn");
      expect(JavaneseDate(date: 17, month: 9, year: 1904).dinapitu, "Sêtu");
    });
  });
}