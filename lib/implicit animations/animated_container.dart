import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _margin = 20;
  double _width = 200;
  double _opacity = 1;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 500,
        ),
        opacity: _opacity,
        child: AnimatedContainer(
          margin: EdgeInsets.all(_margin),
          color: _color,
          width: _width,
          duration: const Duration(
            milliseconds: 500,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                  });
                },
                child: const Text('Animate margin'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _width = 300;
                  });
                },
                child: const Text('Animate width'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.red;
                  });
                },
                child: const Text('Animate color'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0.5;
                  });
                },
                child: const Text('Animate opacity'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _margin = 20;
                    _width = 200;
                    _opacity = 1;
                    _color = Colors.blue;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
