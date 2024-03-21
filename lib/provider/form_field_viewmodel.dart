import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';

class FormFieldViewModel extends ChangeNotifier {
  String name = '';
  int currentDay = 0;
  int currentMonth = 0;
  int currentYear = 0;

  String zodiac = '';

  void submitNameAndDate(String name, String inputDay, String inputMonth, String inputYear) {
    try {
      this.name = name;
      int birthDay = int.parse(inputDay);
      int birthMonth = int.parse(inputMonth);
      int birthYear = int.parse(inputYear);

      DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);
      DateTime currentDate = DateTime.now();

      var jiffyBirthDate = Jiffy.parseFromDateTime(birthDate);
      var jiffyCurrentDate = Jiffy.parseFromDateTime(currentDate);

      var jiffyAge = jiffyCurrentDate.subtract(years: jiffyBirthDate.year, months: jiffyBirthDate.month, days: jiffyBirthDate.daysInMonth);

      currentDay = jiffyAge.daysInMonth;
      currentMonth = jiffyAge.month;
      currentYear = jiffyAge.year;

      calculateZodiac(birthDay ,birthMonth);
    } catch (error) {
      rethrow;
    }
  }

  void calculateZodiac(int birthDay, int birthMonth) {
    if (birthMonth < 13){
      switch (birthMonth) {
        case 1:
          comparison(birthDay, 19, 'Capricorn', 'Aquarius');
          break;
        case 2:
          comparison(birthDay, 18, 'Aquarius', 'Pisces');
          break;
        case 3:
          comparison(birthDay, 20, 'Pisces', 'Aries');
          break;
        case 4:
          comparison(birthDay, 19, 'Aries', 'Taurus');
          break;
        case 5:
          comparison(birthDay, 20, 'Taurus', 'Gemini');
          break;
        case 6:
          comparison(birthDay, 20, 'Gemini', 'Cancer');
          break;
        case 7 :
          comparison(birthDay, 22, 'Cancer', 'Leo');
          break;
        case 8 :
          comparison(birthDay, 22, 'Leo', 'Virgo');
          break;
        case 9 :
          comparison(birthDay, 23, 'Virgo', 'Libra');
          break;
        case 10 :
          comparison(birthDay, 22, 'Libra', 'Scorpio');
          break;
        case 11 :
          comparison(birthDay, 21, 'Scorpio', 'Sagittarius');
          break;
        case 12 :
          comparison(birthDay, 21, 'Sagittarius', 'Capricorn');
          break;
      }
    }
  }

  void comparison(int birthDay, int day, String zodiac1, String zodiac2){
    if (birthDay <= day){
      zodiac = zodiac1;
    } else {
      zodiac = zodiac2;
    }
  }
}
