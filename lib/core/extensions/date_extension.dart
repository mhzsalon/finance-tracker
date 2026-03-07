extension DateTimeRelativeExtension on DateTime {
  String toRelativeDate({bool smart = false}) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(year, month, day);

    final difference = target.difference(today).inDays;

    if (difference == 0) return "Today";
    if (difference == 1) return "Tomorrow";
    if (difference == -1) return "Yesterday";

    if (!smart || difference.abs() <= 7) {
      return difference > 0
          ? "In $difference days"
          : "${difference.abs()} days ago";
    }

    return "$day/$month/$year";
  }
}
