import 'package:flutter/material.dart';
import 'package:navegacion_mercado/layout/detalle_producto.dart';
 
void main() {
  runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      home: DetalleProducto(
        productor: Productor(
          nombre: 'Finca La Esperanza',
          descripcion: 'Vereda El Retiro · 3.2 km',
          productos: const [
            Producto(nombre: 'Tomate chonto', precio: 3200, unidad: 'libra', emoji: '🍅'),
            Producto(nombre: 'Lechuga crespa', precio: 1800, unidad: 'unidad', emoji: '🥬'),
            Producto(nombre: 'Zanahoria criolla', precio: 2100, unidad: 'libra', emoji: '🥕'),
            Producto(nombre: 'Cilantro fresco', precio: 1200, unidad: 'atado', emoji: '🌿'),
          ],
        ),
      ),
    );
  }
}
 
