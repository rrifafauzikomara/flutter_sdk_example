import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:flutter_sdk_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('using context', (tester) async {
    late BuildContext testContext;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: PhraseLocalizations.localizationsDelegates,
      supportedLocales: PhraseLocalizations.supportedLocales,
      home: Builder(builder: (BuildContext context) {
        // use a Builder widget so that we can get a build context element in a tree branch with translations setup
        testContext = context;
        return MyHomePage(onChangeLocale: (_) {});
      }),
    ));

    await tester.pumpAndSettle();

    expect(
      find.text(AppLocalizations.of(testContext).textSimple),
      findsOneWidget,
    );
    expect(
      find.text(AppLocalizations.of(testContext).textWithParams(123456, "(!)")),
      findsOneWidget,
    );
    expect(
      find.text(AppLocalizations.of(testContext)
          .textWithDate(DateTime.utc(1996, 7, 10))),
      findsOneWidget,
    );
    expect(
      find.text(AppLocalizations.of(testContext).textPlural(0)),
      findsOneWidget,
    );

    final fab = find.widgetWithIcon(FloatingActionButton, Icons.add);
    await tester.tap(fab);
    await tester.pump();

    expect(find.text(AppLocalizations.of(testContext).textPlural(1)),
        findsOneWidget);
  });

  testWidgets('using AppLocalizations', (tester) async {
    late AppLocalizations localizations;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: PhraseLocalizations.localizationsDelegates,
      supportedLocales: PhraseLocalizations.supportedLocales,
      home: Builder(builder: (BuildContext context) {
        // use a Builder widget so that we can get a build context element in a tree branch with translations setup
        localizations = AppLocalizations.of(context);
        return MyHomePage(onChangeLocale: (_) {});
      }),
    ));

    await tester.pumpAndSettle();

    expect(
      find.text(localizations.textSimple),
      findsOneWidget,
    );
    expect(
      find.text(localizations.textWithParams(123456, "(!)")),
      findsOneWidget,
    );
    expect(
      find.text(localizations.textWithDate(DateTime.utc(1996, 7, 10))),
      findsOneWidget,
    );
    expect(
      find.text(localizations.textPlural(0)),
      findsOneWidget,
    );

    final fab = find.widgetWithIcon(FloatingActionButton, Icons.add);
    await tester.tap(fab);
    await tester.pump();

    expect(find.text(localizations.textPlural(1)), findsOneWidget);
  });
}
