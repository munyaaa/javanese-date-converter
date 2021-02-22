import 'package:javanese_date_converter/date/date.dart';
import 'package:javanese_date_converter/javanese_date/pasaran.dart';
import 'package:javanese_date_converter/javanese_date/wetonan.dart';

abstract class IJavaneseDate {
  /// Pasaran is five-day cycle consists of [Pon], [Wage], [Kliwon], [Legi], [Pahing].
  Pasaran get pasaran;
  /// Dinapitu is seven-day wuku cycle corresponds to day names in Gregorian.
  String get dinapitu;
  /// Combination of five-day pancawara cycle with the seven-day wuku week cycle.
  /// It usually used for divinatory systems, celebrations, and 
  /// rites of passage as birth or death.
  Wetonan get wetonan;
}

/// This class is depends on Javanese Calendar. Indonesia traditional calendar in Java island
class JavaneseDate extends Date implements IJavaneseDate {
  JavaneseDate({
    int day,
    int month,
    int year,
  }): super(
    day: day,
    month: month,
    year: year,
  );

  JavaneseDate.fromDateTime(
    DateTime dateTime
  ): super.fromDateTime(
    dateTime,
  );

  @override
  String get dinapitu {
    switch (this.weekday) {
      case WeekDay.SATURDAY:
        return "S${String.fromCharCode(234)}tu";
      case WeekDay.SUNDAY:
        return "Ngahad";
      case WeekDay.MONDAY:
        return "S${String.fromCharCode(234)}n${String.fromCharCode(232)}n";
      case WeekDay.TUESDAY:
        return "Selasa";
      case WeekDay.WEDNESDAY:
        return "R${String.fromCharCode(234)}bo";
      case WeekDay.THURSDAY:
        return "K${String.fromCharCode(234)}mis";
      case WeekDay.FRIDAY:
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
