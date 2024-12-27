import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutteranimation/button.dart';
import 'package:flutteranimation/explicit%20animations/animaiton_controlller.dart';
import 'package:flutteranimation/explicit%20animations/curve_animation.dart';
import 'package:flutteranimation/implicit%20animations/tween_animaiton.dart';

import 'implicit animations/list_animation.dart';
import 'implicit animations/animated_container.dart';
import 'implicit animations/list_animation_staggared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    _listener = AppLifecycleListener(
      onStateChange: (value) {
        log(value.toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              page: AnimatedContainerScreen(),
              text: 'AnimatedContainerScreen',
            ),
            Button(
              page: TweenAnimation(),
              text: 'TweenAnimation',
            ),
            Button(
              page: AnimationControllerPage(),
              text: 'AnimationControllerPage',
            ),
            Button(
              page: CurveAnimationPage(),
              text: 'CurveAnimationPage',
            ),
            Button(
              page: ListAnimationPage(),
              text: 'ListAnimationPage',
            ),
            Button(
              page: ListStaggerdAnimationPage(),
              text: 'ListStaggerdAnimationPage',
            ),
          ],
        ),
      ),
    );
  }
}
