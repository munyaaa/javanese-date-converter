import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/date/date.dart';

void main() {
  group('Should have a valid date', () {
    test('Date should be equal to the input', () {
      Date dateInstance = Date(day: 29, month: 2, year: 2020);
      expect(dateInstance.day, 29);
      expect(dateInstance.month, 2);
      expect(dateInstance.year, 2020);
    });
    test('Date should be error if not in a valid date', () {
      expect(() {
        Date _ = Date(day: 30, month: 2, year: 1998);
      }, throwsException);
      expect(() {
        Date _ = Date(day: 35, month: 1, year: 1998);
      }, throwsAssertionError);
      expect(() {
        Date _ = Date(day: 31, month: 6, year: 1998);
      }, throwsException);
      expect(() {
        Date _ = Date(day: 30, month: 6, year: 98);
      }, throwsAssertionError);
    });
    test('Get day func should return a correct day', () {
      expect(Date(day: 21, month: 4, year: 1879).weekday, WeekDay.MONDAY);
      expect(Date(day: 17, month: 9, year: 1904).weekday, WeekDay.SATURDAY);
    });
  });
}
