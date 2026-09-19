import 'package:flutter/material.dart';
import 'package:navegacion_mercado/layout/inicio_sesion.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const verdePastel = Color(0xFFA8D5BA);
    const verdeTexto = Color(0xFF315C43);

    return MaterialApp(
      title: 'Mercado Campesino',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: verdePastel,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7FBF7),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: verdePastel,
          foregroundColor: verdeTexto,
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: verdeTexto,
          ),
          iconTheme: IconThemeData(color: verdeTexto),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: verdeTexto,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: verdeTexto,
          ),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: verdeTexto,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: verdeTexto, width: 2),
          ),
          floatingLabelStyle: TextStyle(color: verdeTexto),
        ),
      ),
      home: PantallaInicioSesion(),
    );
  }
}
