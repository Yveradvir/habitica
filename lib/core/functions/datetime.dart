DateTime normalizeDate(DateTime date) {
  return DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);
}

DateTime normalizedNow() {
  return normalizeDate(DateTime.now());
}

bool isDatesEqual(DateTime f, DateTime s) =>
    normalizeDate(f) == normalizeDate(s);
