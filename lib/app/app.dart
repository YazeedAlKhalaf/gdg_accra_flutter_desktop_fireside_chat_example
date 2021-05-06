import 'package:flutter/material.dart';
import 'package:flutter_desktop_fireside_chat_example/ui/views/main_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff396AFF),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainView(),
    );
  }
}
