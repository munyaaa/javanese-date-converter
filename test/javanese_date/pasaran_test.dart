import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';

void main() {
  group('Should return a valid pasaran', () {
    test('Should return a correct pasaran type', () {
      expect(Pasaran(JavaneseDate(day: 21, month: 4, year: 1879)).pasaranType,
          PasaranType.PAHING);
      expect(Pasaran(JavaneseDate(day: 17, month: 9, year: 1904)).pasaranType,
          PasaranType.PAHING);
      expect(Pasaran(JavaneseDate(day: 8, month: 7, year: 1633)).pasaranType,
          PasaranType.LEGI);
    });
    test('Should return a correct pasaran', () {
      expect(Pasaran(JavaneseDate(day: 21, month: 4, year: 1879)).pasaran,
          "Pahing");
      expect(
          Pasaran(JavaneseDate(day: 8, month: 7, year: 1633)).pasaran, "Lêgi");
    });

    test('Should return a correct associated symbols', () {
      expect(
          Pasaran(
            JavaneseDate(day: 21, month: 4, year: 1879),
          ).associatedSymbols,
          {
            "krama": "Pahit",
            "meaning": "bitter",
            "element": "fire",
            "color": "red",
            "direction": "south",
            "posture": "to face",
          });
    });
  });
}
