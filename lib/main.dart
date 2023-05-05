import 'package:flutter/material.dart';
import 'package:flutter_sdk_example/di/dependency.dart';
import 'package:flutter_sdk_example/di/injections.dart';
import 'package:flutter_sdk_example/localization/example_localization.dart';
import 'package:phrase/phrase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Phrase.setup("", "");
  Injections().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  Locale? _forceLocale;

  @override
  Widget build(BuildContext context) {
    final localization = ExampleLocalization(context: context);
    return MaterialApp(
      title: 'Phrase SDK Example',
      localizationsDelegates: localization.localizationsDelegates,
      supportedLocales: localization.supportedLocales,
      home: MyHomePage(
        onChangeLocale: (locale) => setState(() => _forceLocale = locale),
      ),
      locale: _forceLocale,
      navigatorKey: navigatorKey,
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
  final ExampleLocalization localization = sl<ExampleLocalization>();

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
        title: Text(localization.tr.screenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(localization.tr.textSimple),
            Text(localization.tr.textWithParams(123456, "(!)")),
            Text(localization.tr.textWithDate(DateTime.utc(1996, 7, 10))),
            Text(
              localization.tr.textPlural(_counter),
              style: Theme.of(context).textTheme.headlineMedium,
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
