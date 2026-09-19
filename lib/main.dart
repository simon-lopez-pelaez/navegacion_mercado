import 'package:flutter/material.dart';
import 'package:navegacion_mercado/layout/inicio_sesion.dart';


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
      home: PantallaInicioSesion(),
    );
  }
}
