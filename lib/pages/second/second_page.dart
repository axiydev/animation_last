import 'package:animation_last/consts/consts.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const String path = '/second';
  final String text;
  final String? image;
  const SecondPage({required this.text, required this.image, super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: widget.text,
              child: Image.asset(
                widget.image ?? MyImages.wild,
                width: 200,
              ),
            ),
            Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
