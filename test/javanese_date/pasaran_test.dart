import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';

void main() {
  group('Should return a valid pasaran', () {
    test('Should return a correct pasaran type', () {
      expect(Pasaran(JavaneseDate(date: 21, month: 4, year: 1879)).pasaranType, PasaranType.PAHING);
      expect(Pasaran(JavaneseDate(date: 17, month: 9, year: 1904)).pasaranType, PasaranType.PAHING);
      expect(Pasaran(JavaneseDate(date: 8, month: 7, year: 1633)).pasaranType, PasaranType.LEGI);
    });
    test('Should return a correct pasaran in string', () {
      expect(Pasaran(JavaneseDate(date: 21, month: 4, year: 1879)).toString(), "Pahing");
      expect(Pasaran(JavaneseDate(date: 8, month: 7, year: 1633)).toString(), "Lêgi");
    });
  });
}