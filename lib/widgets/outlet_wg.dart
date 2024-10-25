import 'package:flutter/material.dart';

class OutletItem extends StatelessWidget {
  const OutletItem({super.key, required this.itemLabel});
  final String itemLabel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        color: Colors.greenAccent,
        child: Center(child:Text(itemLabel)),
        ),
        );
  }
}