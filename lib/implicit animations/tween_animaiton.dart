import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: 1,
                ),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: value * 30, left: value * 20),
                      child: child,
                    ),
                  );
                },
                duration: const Duration(milliseconds: 500),
                child: const Text(
                  'TWEEEN ANIMATION',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
