// en este archivo se agregá una opción para crear y enviar mensajes 
import 'package:flutter/material.dart';

class PantallaMensajes extends StatelessWidget {
  const PantallaMensajes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pantalla Mensajes',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
