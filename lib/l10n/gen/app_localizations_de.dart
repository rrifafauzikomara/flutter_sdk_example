import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get textSimple => 'Einfacher Text';

  @override
  String textWithParams(int amount, String comment) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.compactCurrency(
      locale: localeName,
      decimalDigits: 2
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Text mit Parametern: $amountString $comment';
  }

  @override
  String textWithDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Text mit Datum: $dateString';
  }

  @override
  String textPlural(num howMany) {
    return intl.Intl.pluralLogic(
      howMany,
      locale: localeName,
      zero: 'Keine Klicks',
      one: '$howMany Klick',
      two: '$howMany klicks',
      few: '$howMany klicks',
      many: '$howMany klicks',
      other: '$howMany klicks',
    );
  }

  @override
  String get screenTitle => 'Phrase für das Flutter-Demoprojekt';
}
