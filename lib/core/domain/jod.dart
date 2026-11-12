/// Parses a JOD decimal into integer fils without using floating-point math.
int? parseJodFils(String input) {
  final normalized = input
      .trim()
      .replaceAllMapped(RegExp('[٠-٩۰-۹]'), (match) {
        final code = match[0]!.codeUnitAt(0);
        return (code >= 0x06f0 ? code - 0x06f0 : code - 0x0660).toString();
      })
      .replaceAll('٫', '.')
      .replaceAll(',', '.');
  final match = RegExp(
    r'^([0-9]{0,6})(?:\.([0-9]{1,3}))?$',
  ).firstMatch(normalized);
  if (match == null || normalized.isEmpty) return null;
  final dinars = int.tryParse(match[1]!) ?? 0;
  final fils = int.parse((match[2] ?? '').padRight(3, '0'));
  return dinars * 1000 + fils;
}

String jodDecimal(int fils) {
  final absolute = fils.abs();
  return '${fils < 0 ? '-' : ''}${absolute ~/ 1000}.'
      '${(absolute % 1000).toString().padLeft(3, '0')}';
}
