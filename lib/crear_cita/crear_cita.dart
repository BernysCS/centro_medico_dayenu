//En este archivo se agregá la opción para crear una cita y mostrarla en la pantalla de principal
import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:flutter/material.dart';

class PantallaCrearCita extends StatefulWidget {
  final Function(Cita) onCrearCita;

  const PantallaCrearCita({super.key, required this.onCrearCita});

  @override
  State<PantallaCrearCita> createState() => _PantallaCrearCitaState();
}

class _PantallaCrearCitaState extends State<PantallaCrearCita> {
  final _pacienteController = TextEditingController();
  final _motivoController = TextEditingController();
  final _telefonoController = TextEditingController();
  DateTime _fechaSeleccionada = DateTime.now();

  void _crearCita() {
    final nuevaCita = Cita(
      paciente: _pacienteController.text,
      fecha: _fechaSeleccionada,
      motivo: _motivoController.text,
      telefono: _telefonoController.text,
    );

    widget.onCrearCita(nuevaCita); // Llama a la función pasada desde Navegacion
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: _pacienteController, decoration: InputDecoration(labelText: 'Paciente')),
        TextField(controller: _motivoController, decoration: InputDecoration(labelText: 'Motivo')),
        TextField(controller: _telefonoController, decoration: InputDecoration(labelText: 'Telefono')),
        ElevatedButton(
          onPressed: _crearCita,
          child: Text('Crear cita'),
        ),
      ],
    );
  }
}

