import 'package:cozy_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO : https://stackoverflow.com/questions/60930636/how-can-i-use-show-case-view-in-flutter
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const Application());
}
