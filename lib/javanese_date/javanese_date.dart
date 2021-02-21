import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';
import 'package:javanese_date_converter/javanese_date/wetonan.dart';
import 'package:meta/meta.dart';

abstract class IJavaneseDate {
  Pasaran get pasaran;
  String get dinapitu;
  Wetonan get wetonan;
}

class JavaneseDate extends Date implements IJavaneseDate {
  JavaneseDate({
    @required int date,
    @required int month,
    @required int year,
  }): super(
    date: date,
    month: month,
    year: year,
  );

  @override
  String get dinapitu {
    switch (this.day) {
      case Day.SATURDAY:
        return "S${String.fromCharCode(234)}tu";
      case Day.SUNDAY:
        return "Ngahad";
      case Day.MONDAY:
        return "S${String.fromCharCode(234)}n${String.fromCharCode(232)}n";
      case Day.TUESDAY:
        return "Selasa";
      case Day.WEDNESDAY:
        return "R${String.fromCharCode(234)}bo";
      case Day.THURSDAY:
        return "K${String.fromCharCode(234)}mis";
      case Day.FRIDAY:
        return "Jemuwah";
      default:
        throw Exception("Error: Invalid date");
    }
  }

  @override
  Pasaran get pasaran => Pasaran(this);

  @override
  Wetonan get wetonan => Wetonan(this);
}
