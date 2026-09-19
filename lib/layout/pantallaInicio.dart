import 'package:flutter/material.dart';

import 'detalle_producto.dart';
import 'inicio_sesion.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({
    super.key,
    required this.nombre,
    required this.correo,
  });

  final String nombre;
  final String correo;

  static final List<Productor> _productores = [
    Productor(
      nombre: 'Finca La Esperanza',
      descripcion: 'Vereda El Retiro · 3.2 km',
      productos: const [
        Producto(nombre: 'Tomate chonto', precio: 3200, unidad: 'libra', emoji: '🍅'),
        Producto(nombre: 'Lechuga crespa', precio: 1800, unidad: 'unidad', emoji: '🥬'),
        Producto(nombre: 'Zanahoria criolla', precio: 2100, unidad: 'libra', emoji: '🥕'),
        Producto(nombre: 'Cilantro fresco', precio: 1200, unidad: 'atado', emoji: '🌿'),
      ],
    ),
    Productor(
      nombre: 'Finca El Manantial',
      descripcion: 'Vereda San José · 3.5 km',
      productos: const [
        Producto(nombre: 'Papa pastusa', precio: 2500, unidad: 'libra', emoji: '🥔'),
        Producto(nombre: 'Cebolla larga', precio: 1500, unidad: 'atado', emoji: '🧅'),
        Producto(nombre: 'Aguacate hass', precio: 2000, unidad: 'unidad', emoji: '🥑'),
        Producto(nombre: 'Huevos criollos', precio: 12000, unidad: 'docena', emoji: '🥚'),
      ],
    ),
    Productor(
      nombre: 'Huerta Doña Rosa',
      descripcion: 'Vereda La Playa · 5 km',
      productos: const [
        Producto(nombre: 'Fresas', precio: 4000, unidad: 'canasta', emoji: '🍓'),
        Producto(nombre: 'Mora', precio: 3500, unidad: 'libra', emoji: '🫐'),
        Producto(nombre: 'Limón tahití', precio: 1000, unidad: 'unidad', emoji: '🍋'),
        Producto(nombre: 'Plátano', precio: 800, unidad: 'unidad', emoji: '🍌'),
      ],
    ),
    Productor(
      nombre: 'Granja Los Naranjos',
      descripcion: 'Vereda El Vergel · 6.2 km',
      productos: const [
        Producto(nombre: 'Naranja valencia', precio: 1200, unidad: 'unidad', emoji: '🍊'),
        Producto(nombre: 'Queso campesino', precio: 9000, unidad: 'libra', emoji: '🧀'),
        Producto(nombre: 'Leche fresca', precio: 3000, unidad: 'litro', emoji: '🥛'),
        Producto(nombre: 'Miel de abejas', precio: 15000, unidad: 'frasco', emoji: '🍯'),
      ],
    ),
    Productor(
      nombre: 'Cultivos El Roble',
      descripcion: 'Vereda La Cascada · 8 km',
      productos: const [
        Producto(nombre: 'Maíz tierno', precio: 1000, unidad: 'unidad', emoji: '🌽'),
        Producto(nombre: 'Frijol cargamanto', precio: 4500, unidad: 'libra', emoji: '🫘'),
        Producto(nombre: 'Pepino cohombro', precio: 1500, unidad: 'unidad', emoji: '🥒'),
        Producto(nombre: 'Pimentón', precio: 1800, unidad: 'unidad', emoji: '🫑'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Mercado Campesino'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola, $nombre',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _productores.length,
              itemBuilder: (context, index) {
                final productor = _productores[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
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
                  child: ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF6FAF82),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.storefront),
                      ],
                    ),
                    title: Text(
                      productor.nombre,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(productor.descripcion),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalleProducto(productor: productor),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Cerrar sesión'),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const PantallaInicioSesion(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}