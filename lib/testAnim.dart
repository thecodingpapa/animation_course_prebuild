import 'package:animation_course_prebuild/scrollData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TestAnimation extends StatefulWidget {
  const TestAnimation({
    super.key,
  });

  @override
  State<TestAnimation> createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {});
    });

    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    final zeroOne = zeroToOne();
    final curveApplied = applyCurves(zeroOne);
    final opacity = applyOpacity(curveApplied);

    final rotX = rotateX(zeroOne);

    final scale = applySize(zeroOne);
    return Positioned.fill(
      child: Center(
          child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..scale(scale, scale)
          ..rotateX(rotX)
          ..rotateY(rotX),
        alignment: Alignment.center,
        child: Opacity(
          opacity: opacity,
          child: const Text(
            'Airpods Pro',
            style: TextStyle(
                fontSize: 100,
                fontFamily: 'SFPro',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      )),
    );
  }

  double rotateX(double curved) {
    return -0.9 * curved + 0.9;
  }

  double zeroToOne() {
    if (scrollData.scrollPercentage < 0) {
      return 0;
    } else if (scrollData.scrollPercentage > 0.5) {
      return 1;
    } else {
      return 2 * scrollData.scrollPercentage;
    }
  }

  double applyCurves(double zeroToOneValue) {
    return Curves.easeInQuint.transform(zeroToOneValue);
  }

  double applyOpacity(double curveAppliedValue) {
    return -1 * curveAppliedValue + 1;
  }

  double applySize(double zeroToOne) {
    return zeroToOne + 1;
  }
}
