import './screens/screen.dart';
import 'package:flutter/material.dart';
import './screens/answerquwstion.dart';
import './screens/allcountryies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        QuestionAnswer.routname: (context) => QuestionAnswer(),
        CountriesInfo.routname: (context) => CountriesInfo(),
      },
    );
  }
}
