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
          onPressed: () => Navigator.pop(context),
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
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.08),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD49A45),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(producto.emoji, style: const TextStyle(fontSize: 28)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.nombre,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '\$${producto.precio.toStringAsFixed(0)} / ${producto.unidad}',
                                style: TextStyle(color: Colors.grey[600], fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        if (cantidad > 0) ...[
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _eliminar(index),
                          ),
                          Text('$cantidad', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.green,
                          ),
                          onPressed: () => _agregar(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 24),
            Text(
              'Total: \$${_total.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Comprar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}