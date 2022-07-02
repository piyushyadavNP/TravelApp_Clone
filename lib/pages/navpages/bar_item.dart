import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  const BarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Nav Item Page"),
      ),
    );
  }
}
