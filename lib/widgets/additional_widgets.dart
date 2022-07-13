import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenPageWithAnimation extends StatelessWidget {
  final Widget openWidget;
  final Widget pressWidget;
  const OpenPageWithAnimation(
      {super.key, required this.openWidget, required this.pressWidget});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        openElevation: 0,
        closedElevation: 0,
        closedColor: Colors.transparent,
        openShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        transitionDuration: const Duration(seconds: 2),
        closedBuilder: (context, onPress) => InkWell(
              onTap: onPress,
              child: pressWidget,
            ),
        openBuilder: (context, onPress) => openWidget);
  }
}
