import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';

void main() {
  group('Should have a valid javanese date', () {
    test('Should can input the right object props', () {
      JavaneseDate javaneseDate = JavaneseDate(day: 31, month: 1, year: 1998);
      expect(javaneseDate.day, 31);
      expect(javaneseDate.month, 1);
      expect(javaneseDate.year, 1998);
    });
    test('Should can input the right object props from date time', () {
      JavaneseDate javaneseDate = JavaneseDate.fromDateTime(DateTime(1998, 1, 31));
      expect(javaneseDate.day, 31);
      expect(javaneseDate.month, 1);
      expect(javaneseDate.year, 1998);
    });
    test('Should return exception', () {
      expect(() {
        JavaneseDate _ = JavaneseDate(day: null, month: 2, year: 1998);
      }, throwsAssertionError);
      expect(() {
        JavaneseDate _ = JavaneseDate(day: 31, month: 2, year: 1998);
      }, throwsException);
    });
    test('Should return correct dinapitu', () {
      expect(JavaneseDate(day: 21, month: 4, year: 1879).dinapitu, "Sênèn");
      expect(JavaneseDate(day: 17, month: 9, year: 1904).dinapitu, "Sêtu");
    });
  });
}