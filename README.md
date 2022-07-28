<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

With this package, you can use a widget that can perform date selection on iOS and Android devices. Inspired from cupertino_date_textbox package.

## Features

Select any date with cupertino style

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/82556567/181524730-bcdc6a81-2cc8-4c02-997b-5449cef05ef3.gif)


There is an example, you can check it to /example folder.

```dart
   DatePickerCupertino(
                hintText: 'Select a date:',
                onDateTimeChanged: (date) {
                  debugPrint('Selected date is: $date');
                })
```
  - hintText: Text stating that the date should be selected.
  - onDateTimeChanged: Menu where date is selected.

## Additional information

It can be made more flexible in the future.
# datepicker_cupertino
