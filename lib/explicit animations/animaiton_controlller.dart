import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({super.key});

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;

  //! Curve animation
  late Animation<double> _curveAnimation;

  bool isfav = false;

  @override
  void initState() {
    super.initState();

    //! Animation controller
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    //! Curve
    _curveAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    //! To animate from one color to another
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(
        // _animationController
        _curveAnimation);

    //! Animation lsitener
    _animationController.addListener(() {
      log(_animationController.value.toString());
      log(_colorAnimation.value.toString());
    });

    //! Move between diffrent tween sequences
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 64, end: 90), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 90, end: 64), weight: 50),
    ]).animate(
        // _animationController
        _curveAnimation);

    //! Animation status listener
    _animationController.addStatusListener((status) {
      log(status.toString());
      if (status == AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isfav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return IconButton(
              onPressed: () {
                isfav
                    ? _animationController.reverse()
                    : _animationController.forward();
              },
              icon: Icon(
                Icons.favorite_rounded,
                size: _sizeAnimation.value,
                color: _colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
