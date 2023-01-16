import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amber)),
      home: HomePage(),
    );
  }
}
