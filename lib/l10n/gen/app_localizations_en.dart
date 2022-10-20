import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get textSimple => 'Simple Text';

  @override
  String textWithParams(int amount, String comment) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.compactCurrency(
      locale: localeName,
      decimalDigits: 2
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Text with parameters: $amountString $comment';
  }

  @override
  String textWithDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Text with date: $dateString';
  }

  @override
  String textPlural(num howMany) {
    return intl.Intl.pluralLogic(
      howMany,
      locale: localeName,
      zero: 'No clicks',
      one: '$howMany click',
      two: '$howMany clicks',
      few: '$howMany clicks',
      many: '$howMany clicks',
      other: '$howMany clicks',
    );
  }

  @override
  String get screenTitle => 'Phrase for Flutter Demo Project';
}
