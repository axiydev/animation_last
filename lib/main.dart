import 'package:animation_last/pages/first/first_page.dart';
import 'package:animation_last/pages/fourth/fourth_page.dart';
import 'package:animation_last/pages/second/second_page.dart';
import 'package:animation_last/pages/third/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.path: (context) => const HomePage(),
        ThirdPage.path: (context) => const ThirdPage(),
        FourthPage.path: (context) => const FourthPage(),
        SecondPage.path: (context) => const SecondPage(
              text: '',
              image: '',
            )
      },
      initialRoute: ThirdPage.path,
    );
  }
}
