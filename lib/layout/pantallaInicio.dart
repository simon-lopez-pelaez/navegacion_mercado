import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mercado Campesino'),
            Text(
              'Hola, Bienvenid@',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                const productores = [
                  ('correo@example.com', 'Descripcion', '2 km'),
                  ('otro@example.com', 'Descripcion', '3.5 km'),
                  ('tercero@example.com', 'Descripcion', '5 km'),
                  ('cuarto@example.com', 'Descripcion', '6.2 km'),
                  ('quinto@example.com', 'Descripcion', '8 km'),
                ];
                final productor = productores[index];

                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(productor.$1),
                  subtitle: Text(
                    'Vereda: ${productor.$2} · Distancia: ${productor.$3}',
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: const Text('Explorar Productos'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Acción al seleccionar un elemento del BottomNavigationBar
        },
      )
    );
  }
}