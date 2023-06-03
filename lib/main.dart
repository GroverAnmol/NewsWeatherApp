import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      home:MainScreen(),
    );
  }
}

