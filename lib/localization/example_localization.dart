import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:intl/intl.dart';
import 'package:phrase/phrase.dart';

class ExampleLocalization {
  final BuildContext context;

  const ExampleLocalization({required this.context});

  AppLocalizations get tr => AppLocalizations.of(context);

  String getString(String key) {
    /// This locale should be a same as in "AppLocalizations" class
    Locale currentLocale = Localizations.localeOf(context);
    String localeCode = Intl.canonicalizedLocale(currentLocale.toString());
    return Phrase.getText(localeCode, key) ?? key;
  }

  List<LocalizationsDelegate> get localizationsDelegates =>
      PhraseLocalizations.localizationsDelegates;

  List<Locale> get supportedLocales => PhraseLocalizations.supportedLocales;
}
