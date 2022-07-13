import 'package:animation_last/pages/second/second_page.dart';
import 'package:animation_last/widgets/additional_widgets.dart';
import 'package:flutter/material.dart';

//animations package
class HomePage extends StatefulWidget {
  static const path = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OpenPageWithAnimation(
          pressWidget: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              alignment: Alignment.center,
              child: const Icon(
                Icons.play_arrow,
                size: 35,
              )),
          openWidget: const SecondPage(),
        )),
        floatingActionButton: OpenPageWithAnimation(
          pressWidget: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              alignment: Alignment.center,
              child: const Icon(
                Icons.play_arrow,
                size: 35,
              )),
          openWidget: const SecondPage(),
        ));
  }
}
