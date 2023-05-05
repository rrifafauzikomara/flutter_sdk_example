import 'package:flutter_sdk_example/localization/example_localization.dart';
import 'package:flutter_sdk_example/main.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class RegisterLocalization {
  RegisterLocalization() {
    _registerCore();
  }

  void _registerCore() {
    sl.registerLazySingleton(
      () => ExampleLocalization(
        context: navigatorKey.currentContext!,
      ),
    );
  }
}
