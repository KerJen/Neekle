extension DurationFormatters on Duration {
  String mmss() {
    return '$this'.split('.')[0].padLeft(8, '0');
  }
}
