//En este archivo se mostrará todas las citas que se han creado
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pantalla Principal (Citas)',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
