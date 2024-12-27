import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.page, required this.text});

  final Widget page;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ));
          },
          child: Center(
            child: Text(text),
          )),
    );
  }
}
