import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      title: 'Mercado Campesino',
      home: const Scaffold(
        body: Center(child: Text('Mercado Campesino')),
      ),
    );
  }
}
