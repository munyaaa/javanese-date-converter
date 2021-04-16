import 'package:javanese_date_converter/date/formula_init.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';

enum PasaranType {
  PON,
  WAGE,
  KLIWON,
  LEGI,
  PAHING,
}

abstract class IPasaran {
  PasaranType get pasaranType;
  String get pasaran;
}

class Pasaran implements IPasaran {
  final JavaneseDate javaneseDate;

  Pasaran(this.javaneseDate);

  @override
  PasaranType get pasaranType {
    int pasaranValue = _calculatePasaran(this.javaneseDate);
    switch (pasaranValue) {
      case 0:
        return PasaranType.PON;
      case 1:
        return PasaranType.WAGE;
      case 2:
        return PasaranType.KLIWON;
      case 3:
        return PasaranType.LEGI;
      case 4:
        return PasaranType.PAHING;
      default:
        throw Exception("Error: Incorrect pasaran value, should be 0..4");
        break;
    }
  }

  int _calculatePasaran(JavaneseDate date) {
    final FormulaInit fx = FormulaInit(date);
    return (fx.k + ((3 * (fx.m + 1)) ~/ 5) + (fx.y ~/ 4) + (4 * fx.c) - (4 * (fx.c ~/ 4))) % 5;
  }

  @override
  String get pasaran {
    switch (this.pasaranType) {
      case PasaranType.PON:
        return "Pon";
      case PasaranType.WAGE:
        return "Wag${String.fromCharCode(233)}";
      case PasaranType.KLIWON:
        return "Kliwon";
      case PasaranType.LEGI:
        return "L${String.fromCharCode(234)}gi";
      case PasaranType.PAHING:
        return "Pahing";
      default:
        throw Exception("Error: Incorrect pasaran");
        break;
    }
  }
}