import 'package:intl/intl.dart';

String formatCustomDate(DateTime date) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime tomorrow = today.add(Duration(days: 1));

  String formattedDate = DateFormat('dd/MM').format(date); // Format jour/mois
  String weekDay = DateFormat('EEEE').format(date); // Jour de la semaine complet

  if (date.year == today.year &&
      date.month == today.month &&
      date.day == today.day) {
    return 'Today, $formattedDate, $weekDay';
  } else if (date.year == tomorrow.year &&
      date.month == tomorrow.month &&
      date.day == tomorrow.day) {
    return 'Tomorrow, $formattedDate, $weekDay';
  } else {
    return '$formattedDate, $weekDay';
  }
}

String formatTime(Duration newTime) {
  // Déterminer le suffixe (am ou pm)
  int hour = newTime.inHours % 12 == 0 ? 12 : newTime.inHours % 12;
  int minute = newTime.inMinutes % 60;
  String spec = newTime.inHours >= 12 ? 'pm' : 'am';

  // Format final avec suffixe
  String formattedTime = "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $spec";
  // Retourner la chaîne formatée
  return formattedTime;
}