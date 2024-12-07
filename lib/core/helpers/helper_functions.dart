import 'dart:math';

class HelperFunctions {
  static Map<String, String> getRandomMap(List<Map<String, String>> maps) {
    if (maps.isEmpty) {
      throw ArgumentError('The list cannot be empty.');
    }

    final random = Random();
    final randomIndex = random.nextInt(maps.length);
    return maps[randomIndex];
  }

// دالة لإرجاع الساعة فقط
  static int getHour(String time) {
    final timeParts = time.split(' ');
    final hourMinute = timeParts[0].split(':');
    final period = timeParts[1].toLowerCase();

    int hour = int.parse(hourMinute[0]);

    if (period == 'pm' && hour != 12) {
      hour += 12;
    } else if (period == 'am' && hour == 12) {
      hour = 0;
    }

    return hour;
  }

// دالة لإرجاع الدقائق فقط
  static int getMinutes(String time) {
    final timeParts = time.split(' ');
    final hourMinute = timeParts[0].split(':');
    return int.parse(hourMinute[1]);
  }
}
