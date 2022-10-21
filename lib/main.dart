import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:phrase/phrase.dart';

void main() {
  Phrase.setup("", "");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _forceLocale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phrase SDK Example',
      localizationsDelegates: PhraseLocalizations.localizationsDelegates,
      supportedLocales: PhraseLocalizations.supportedLocales,
      home: MyHomePage(
        onChangeLocale: (locale) => setState(() => _forceLocale = locale),
      ),
      locale: _forceLocale,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.onChangeLocale,
    super.key,
  });

  final void Function(Locale) onChangeLocale;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).screenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).textSimple),
            Text(AppLocalizations.of(context).textWithParams(123456, "(!)")),
            Text(AppLocalizations.of(context)
                .textWithDate(DateTime.utc(1996, 7, 10))),
            Text(
              AppLocalizations.of(context).textPlural(_counter),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:
                      Localizations.localeOf(context) == const Locale('en')
                          ? null
                          : () => widget.onChangeLocale(const Locale('en')),
                  child: const Text('en'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed:
                      Localizations.localeOf(context) == const Locale('de')
                          ? null
                          : () => widget.onChangeLocale(const Locale('de')),
                  child: const Text('de'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
