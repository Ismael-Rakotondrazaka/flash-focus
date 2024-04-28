// Helper function to copy a DateTime object
DateTime copyDateTime(
  DateTime original, {
  bool? toUtc,
  Duration? addDuration,
  Duration? subtractDuration,
}) {
  // Start with the same components as the original
  DateTime copy = DateTime(
    original.year,
    original.month,
    original.day,
    original.hour,
    original.minute,
    original.second,
    original.millisecond,
    original.microsecond,
  );

  // Apply time zone conversion if specified
  if (toUtc == true) {
    copy = copy.toUtc();
  } else if (toUtc == false) {
    copy = copy.toLocal();
  }

  // Apply additional duration if specified
  if (addDuration != null) {
    copy = copy.add(addDuration);
  }

  // Apply duration subtraction if specified
  if (subtractDuration != null) {
    copy = copy.subtract(subtractDuration);
  }

  return copy;
}
