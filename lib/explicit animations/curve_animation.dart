import 'package:flutter/material.dart';

class CurveAnimationPage extends StatefulWidget {
  const CurveAnimationPage({super.key});

  @override
  State<CurveAnimationPage> createState() => _CurveAnimationPageState();
}

class _CurveAnimationPageState extends State<CurveAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TweenAnimationBuilder(
          curve: Curves.easeIn,
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100 * value),
                child: child,
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'CURVEANIMATION',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
