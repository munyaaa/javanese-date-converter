import 'package:javanese_date_converter/date/date.dart';

class FormulaInit {
  final Date date;

  FormulaInit(this.date);

  int get k => this.date.day;
  int get m => this.date.month;
  int get c => this.date.century;
  int get y => this.date.twoDigitYear;
}