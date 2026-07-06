class Formatters {
  static String time(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
  }

  static String income(double value) {
    return value.toStringAsFixed(0);
  }

  static String number(int value) {
    return value.toString();
  }
}
