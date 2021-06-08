# Phrase SDK for Flutter example

Flutter demo application to see Phrase OTA in action

## Installation steps

* Clone this project
* Run `flutter pub get` to get the dependencies
* Run `flutter pub run phrase` to perform necessary code generation
* Create new translation project on https://phrase.com/
* Upload ARB files for translation
* Create the OTA distribution
* Copy its ID and secret into `main.dart`:
```dart
void main() {
  Phrase.setup("[DISTRIBUTION_ID]", "[ENVIRONMENT_ID]");
  runApp(MyApp());
}
```
* Run the project on your device e.g. in chrome

```bash
flutter run -d chrome
```


To see the list of devices run:
```bash
flutter devices
```
