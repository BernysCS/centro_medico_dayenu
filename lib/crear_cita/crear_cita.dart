//En este archivo se agregá la opción para crear una cita y mostrarla en la pantalla de principal
import 'package:flutter/material.dart';

class PantallaCrearCita extends StatelessWidget {
  const PantallaCrearCita({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pantalla Crear Cita',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
