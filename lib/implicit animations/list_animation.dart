import 'dart:developer';

import 'package:flutter/material.dart';

class ListAnimationPage extends StatefulWidget {
  const ListAnimationPage({super.key});

  @override
  State<ListAnimationPage> createState() => _ListAnimationPageState();
}

class _ListAnimationPageState extends State<ListAnimationPage> {
  List<Widget> _widgets = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addidgets();
    });
    super.initState();
  }

  void addidgets() {
    List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
    ];
    for (var item in items) {
      _widgets.add(_containerWidget(text: item));
      _key.currentState!.insertItem(_widgets.length - 1);
    }
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    log(_widgets.length.toString());
    return Scaffold(
      body: AnimatedList(
        key: _key,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _widgets[index],
          );
        },
        initialItemCount: _widgets.length,
      ),
    );
  }

  Widget _containerWidget({required String text}) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
