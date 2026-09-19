import 'package:flutter/material.dart';

class Producto {
  final String nombre;
  final double precio;
  final String unidad;
  final String emoji;
 
  const Producto({
    required this.nombre,
    required this.precio,
    required this.unidad,
    this.emoji = '🌱',
  });
}
 
/// Datos básicos del productor.
class Productor {
  final String nombre;
  final String descripcion;
  final List<Producto> productos;
 
  const Productor({
    required this.nombre,
    required this.descripcion,
    required this.productos,
  });
}

class DetalleProducto extends StatefulWidget {
  final Productor productor;

  const DetalleProducto({
    super.key,
    required this.productor,
  });

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  late List<int> _cantidades;

  @override
  void initState() {
    super.initState();
    _cantidades = List<int>.filled(widget.productor.productos.length, 0);
  }

  double get _total {
    double t = 0.0;
    for (int i = 0; i < widget.productor.productos.length; i++) {
      t += widget.productor.productos[i].precio * _cantidades[i];
    }
    return t;
  }

  void _agregar(int index) {
    setState(() {
      _cantidades[index]++;
    });
  }

  void _eliminar(int index) {
    setState(() {
      if (_cantidades[index] > 0) {
        _cantidades[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productor = widget.productor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>Navigator.pushReplacementNamed(context, '/'),;
        ),
        title: Text(productor.nombre),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productor.descripcion,
             style: TextStyle(color: Colors.grey[600], fontSize: 14),
             ),
          const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: productor.productos.length,
                separatorBuilder: (context, index) => const Divider(height: 24),
                itemBuilder: (context, index) {
                  final producto = productor.productos[index];
                  final cantidad = _cantidades[index];
                  return Row(
                    children: [
                      Text(producto.emoji, style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(producto.nombre, style: const TextStyle(fontWeight: FontWeight.w600)),
                            Text(
                              '\$${producto.precio.toStringAsFixed(0)} / ${producto.unidad}',
                              style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      if (cantidad > 0) ...[
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () => _eliminar(index),
                        ),
                        Text('$cantidad', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                        onPressed: () => _agregar(index),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(height: 24),
            Text(
              'Total: \$${_total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}