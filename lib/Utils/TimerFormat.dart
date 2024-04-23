import 'package:intl/intl.dart';

String timerFormat(String time) {
  DateTime dateTime = DateTime.parse(time);
  String formatTime = DateFormat('yyyy-MM-dd').format(dateTime);
  return formatTime;
}
