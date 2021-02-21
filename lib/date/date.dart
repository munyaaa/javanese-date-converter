import 'package:javanese_date_converter/date/day_calculation.dart';
import 'package:meta/meta.dart';

// day calculation is start from Saturday(0)..Friday(6)
enum Day {
  SATURDAY,
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
}

abstract class IDate {
  Day get day;
  int get date;
  int get month;
  int get year;
  int get century;
  int get twoDigitYear;
}

class Date extends IDate {
  int _date;
  int _month;
  int _year;

  Date({
    @required int date,
    @required int month,
    @required int year,
  })  : assert(date != null && date >= 1 && date <= 31, "Error: Not a valid date"),
        assert(month != null && month >= 1 && month <= 12, "Error: Not a valid month"),
        assert(year != null && year.toString().length == 4, "Error: Not a valid year"),
        this._month = month,
        this._year = year {
    if (_isDateValid(date, month, year)) {
      this._date = date;
    } else {
      throw Exception("Error: Not a valid date");
    }
  }

  bool _isDateValid(int date, int month, int year) {
    // first condition should be fulfill
    if (date >= 1 && date <= 31) {
      if (month == 2) {
        if (_isLeapYear(year) == true) {
          return date <= 29 ? true : false;
        } else {
          // not a leap year, so date <= 28
          return date <= 28 ? true : false;
        }
      } else if (month == 4 || month == 6 || month == 9 || month == 11) {
        // in April, June, September, November, date <= 30
        return date <= 30 ? true : false;
      } else {
        // date <= 31
        return true;
      }
    } else {
      return false;
    }
  }

  bool _isLeapYear(int year) {
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Day get day {
    int dayValue = DayCalculation.calculateDay(this);
    switch (dayValue) {
      case 0:
        return Day.SATURDAY;
      case 1:
        return Day.SUNDAY;
      case 2:
        return Day.MONDAY;
      case 3:
        return Day.TUESDAY;
      case 4:
        return Day.WEDNESDAY;
      case 5:
        return Day.THURSDAY;
      case 6:
        return Day.FRIDAY;
      default:
        throw Exception("Error: Incorrect day value, should be 0..6");
        break;
    }
  }

  @override
  int get date => this._date;

  @override
  int get month => this._month;

  @override
  int get year => this._year;

  @override
  int get century => DayCalculation.calculateCentury(this._year);

  @override
  int get twoDigitYear => DayCalculation.calculateTwoDigitYear(this._year, this.century);
}