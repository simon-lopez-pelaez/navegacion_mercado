import 'package:flutter/material.dart';

import 'layout/pantallaInicio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mercado Campesino',
      debugShowCheckedModeBanner: false,
      home: PantallaInicio(),
    );
  }
}
