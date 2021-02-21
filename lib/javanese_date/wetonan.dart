import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/javanese_date/javanese_date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';

abstract class IWetonan {
  int get neptu;
  int get dayNeptu;
  int get pasaranNeptu;
  String get weton;
}

class Wetonan {
  final JavaneseDate javaneseDate;

  Wetonan(this.javaneseDate);

  int get neptu {
    return this.dayNeptu + this.pasaranNeptu;
  }

  int get dayNeptu {
    switch (this.javaneseDate.day) {
      case Day.FRIDAY:
        return 6;
      case Day.SATURDAY:
        return 9;
      case Day.MONDAY:
        return 4;
      case Day.TUESDAY:
        return 3;
      case Day.WEDNESDAY:
        return 7;
      case Day.THURSDAY:
        return 8;
      default:
        throw Exception("Error: Invalid Day");
        break;
    }
  }

  int get pasaranNeptu {
    switch (this.javaneseDate.pasaran.pasaranType) {
      case PasaranType.PON:
        return 7;
      case PasaranType.WAGE:
        return 4;
      case PasaranType.KLIWON:
        return 8;
      case PasaranType.LEGI:
        return 5;
      case PasaranType.PAHING:
        return 9;
      default:
        throw Exception("Error: Invalid Pasaran");
        break;
    }
  }

  String get weton {
    return "${javaneseDate.dinapitu} ${javaneseDate.pasaran.toString()}";
  }
  
}