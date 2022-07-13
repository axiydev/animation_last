import 'dart:math';

import 'package:animation_last/pages/fourth/fourth_page.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  static const String path = '/third';
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double?> _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animation = Tween<double?>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CustomAnimation(
            animation: _animation,
            child: Container(height: 200, width: 200, color: Colors.green)),
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(CustomPageRouter(
              child: const FourthPage(),
            ));
          },
          label: const Text('other page')),
    );
  }
}

///animated widget
class CustomAnimation extends AnimatedWidget {
  @override
  final Widget? child;
  final Animation animation;

  const CustomAnimation(
      {super.key, required this.child, required this.animation})
      : super(listenable: animation);

  Animation<double?> get _progress => animation as Animation<double?>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 2 * _progress.value!,
      child: child,
    );
  }
}

///page route builder
class CustomPageRouter extends PageRouteBuilder {
  Widget child;
  CustomPageRouter({required this.child})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => Align(
                  child: SizeTransition(
                    //ScaleTransition
                    sizeFactor: animation,
                    child: child,
                  ),
                ),
            transitionDuration: const Duration(seconds: 2));
}
