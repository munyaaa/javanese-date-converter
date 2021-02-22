import 'package:javanese_date_converter/date/day_calculation.dart';

enum WeekDay {
  SATURDAY,
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
}

abstract class IDate {
  /// Day of the week consists of Sunday..Saturday.
  WeekDay get weekday;
  /// Date that consists of 31, 30, 29, or 28 per month.
  int get day;
  /// Month that consists of January..December
  int get month;
  /// Period of 365 / 366 days
  int get year;
  /// Period of 100 years
  int get century;
  /// Two digits behind the year
  int get twoDigitYear;
}

/// This class is depends on Gregorian Calendar (AD)
class Date extends IDate {
  int _day;
  int _month;
  int _year;

  Date({
    int day,
    int month,
    int year,
  })  : assert(day != null && day >= 1 && day <= 31, "Error: Not a valid date"),
        assert(month != null && month >= 1 && month <= 12, "Error: Not a valid month"),
        assert(year != null && year.toString().length == 4, "Error: Not a valid year"),
        this._month = month,
        this._year = year {
    if (_isDateValid(day, month, year)) {
      this._day = day;
    } else {
      throw Exception("Error: Not a valid date");
    }
  }

  Date.fromDateTime(DateTime dateTime) {
    this._day = dateTime.day;
    this._month = dateTime.month;
    this._year = dateTime.year;
  }

  bool _isDateValid(int day, int month, int year) {
    // first condition should be fulfill
    if (day >= 1 && day <= 31) {
      if (month == 2) {
        if (_isLeapYear(year) == true) {
          return day <= 29 ? true : false;
        } else {
          // not a leap year, so date <= 28
          return day <= 28 ? true : false;
        }
      } else if (month == 4 || month == 6 || month == 9 || month == 11) {
        // in April, June, September, November, date <= 30
        return day <= 30 ? true : false;
      } else {
        // date <= 31
        return true;
      }
    } else {
      return false;
    }
  }

  /// Leap year is happened in 4 years once
  bool _isLeapYear(int year) {
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  WeekDay get weekday {
    int dayValue = DayCalculation.calculateDay(this);
    switch (dayValue) {
      case 0:
        return WeekDay.SATURDAY;
      case 1:
        return WeekDay.SUNDAY;
      case 2:
        return WeekDay.MONDAY;
      case 3:
        return WeekDay.TUESDAY;
      case 4:
        return WeekDay.WEDNESDAY;
      case 5:
        return WeekDay.THURSDAY;
      case 6:
        return WeekDay.FRIDAY;
      default:
        throw Exception("Error: Incorrect day value, should be 0..6");
        break;
    }
  }

  @override
  int get day => this._day;

  @override
  int get month => this._month;

  @override
  int get year => this._year;

  @override
  int get century => DayCalculation.calculateCentury(this._year);

  @override
  int get twoDigitYear => DayCalculation.calculateTwoDigitYear(this._year, this.century);
}