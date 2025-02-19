import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:flutter_sdk_example/di/dependency.dart';
import 'package:flutter_sdk_example/localization/example_localization.dart';
import 'package:flutter_sdk_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ExampleLocalization localizations;

  setUpAll(() async {
    sl.registerLazySingleton(
        () => ExampleLocalization(context: navigatorKey.currentContext!));
    localizations = sl<ExampleLocalization>();
  });

  testWidgets('using AppLocalizations', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: PhraseLocalizations.localizationsDelegates,
      supportedLocales: PhraseLocalizations.supportedLocales,
      home: MyHomePage(onChangeLocale: (_) {}),
      navigatorKey: navigatorKey,
    ));

    await tester.pumpAndSettle();

    expect(
      find.text(localizations.tr.textSimple),
      findsOneWidget,
    );
    expect(
      find.text(localizations.tr.textWithParams(123456, "(!)")),
      findsOneWidget,
    );
    expect(
      find.text(localizations.tr.textWithDate(DateTime.utc(1996, 7, 10))),
      findsOneWidget,
    );
    expect(
      find.text(localizations.tr.textPlural(0)),
      findsOneWidget,
    );

    final fab = find.widgetWithIcon(FloatingActionButton, Icons.add);
    await tester.tap(fab);
    await tester.pump();

    expect(find.text(localizations.tr.textPlural(1)), findsOneWidget);
  });
}
