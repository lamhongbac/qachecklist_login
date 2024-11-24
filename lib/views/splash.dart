import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Loadding...', 
      style: TextStyle(color: Theme.of(context).colorScheme.primary),),),
    );
  }
}