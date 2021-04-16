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
  /// Pasaran symbols in general
  Map<String, String> get associatedSymbols;
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
    return (fx.k +
            ((3 * (fx.m + 1)) ~/ 5) +
            (fx.y ~/ 4) +
            (4 * fx.c) -
            (4 * (fx.c ~/ 4))) %
        5;
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

  @override
  Map<String, String> get associatedSymbols {
    switch (this.pasaranType) {
      case PasaranType.PON:
        return AssociatedSymbols(
          krama: "Petak",
          meaning: "",
          element: "water",
          color: "yellow",
          direction: "west",
          posture: "sleep",
        ).toJson();
      case PasaranType.WAGE:
        return AssociatedSymbols(
          krama: "Cemeng",
          meaning: "dark",
          element: "earth",
          color: "black",
          direction: "north",
          posture: "sit down",
        ).toJson();
      case PasaranType.KLIWON:
        return AssociatedSymbols(
          krama: "Asih",
          meaning: "affection",
          element: "spirit",
          color: "mixed color",
          direction: "center",
          posture: "stand up",
        ).toJson();
      case PasaranType.LEGI:
        return AssociatedSymbols(
          krama: "Manis",
          meaning: "sweet",
          element: "air",
          color: "white",
          direction: "east",
          posture: "turn back",
        ).toJson();
      case PasaranType.PAHING:
        return AssociatedSymbols(
          krama: "Pahit",
          meaning: "bitter",
          element: "fire",
          color: "red",
          direction: "south",
          posture: "to face",
        ).toJson();
      default:
        throw Exception("Error: Incorrect pasaran");
        break;
    }
  }
}

abstract class IAssociatedSymbols {
  Map<String, dynamic> toJson();
}

class AssociatedSymbols implements IAssociatedSymbols {
  final String krama;
  final String meaning;
  final String element;
  final String color;
  final String direction;
  final String posture;

  AssociatedSymbols({
    this.krama,
    this.meaning,
    this.element,
    this.color,
    this.direction,
    this.posture,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "krama": this.krama ?? "",
      "meaning": this.meaning ?? "",
      "element": this.element ?? "",
      "color": this.color ?? "",
      "direction": this.direction ?? "",
      "posture": this.posture ?? "",
    };
  }
}
