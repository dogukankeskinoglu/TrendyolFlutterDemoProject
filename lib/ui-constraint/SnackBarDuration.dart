enum SnackBarDuration {
  short,
  medium,
  long
}

extension SnackBarDurationSeconds on SnackBarDuration {
  Duration get duration {
    switch(this) {
      case SnackBarDuration.short:
        return const Duration(seconds: 1);
      case SnackBarDuration.medium:
        return const Duration(seconds: 2);
      case SnackBarDuration.long:
        return const Duration(seconds: 3);
      default:
        return throw Exception("Invalid SnackBarDuration");
    }
  }
}