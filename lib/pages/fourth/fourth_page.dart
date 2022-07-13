import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  static const String path = '/fourth_page';
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.red,
    );
  }
}
