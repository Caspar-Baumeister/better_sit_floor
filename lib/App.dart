// ignore: file_names
import 'package:flutter/material.dart';
import 'package:better_sit_floor/pages/home/home.dart';
import 'package:better_sit_floor/shared/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: DARK_GREY,
        primaryColor: PRIMARY_COLOR,
      ),
      home: const Home(),
    );
  }
}
