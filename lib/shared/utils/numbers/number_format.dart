import 'package:intl/intl.dart';

class NumberFormats {
  /// Converts a given number into a human-readable, compact format without a currency symbol.
  ///
  /// The number is formatted using the `compactCurrency` method from the `intl` package,
  /// with zero decimal digits and no currency symbol.
  ///
  /// - Parameter number: The number to be formatted.
  /// - Returns: A string representing the formatted number.
  static String humanReadableNumber(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formattedNumber;
  }
}
