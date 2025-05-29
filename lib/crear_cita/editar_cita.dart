import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:flutter/material.dart';

class PantallaEditarCita extends StatefulWidget {
  final Cita cita;

  const PantallaEditarCita({super.key, required this.cita});

  @override
  State<PantallaEditarCita> createState() => _PantallaEditarCitaState();
}

class _PantallaEditarCitaState extends State<PantallaEditarCita> {
  late TextEditingController _pacienteController;
  late TextEditingController _motivoController;
  late TextEditingController _telefonoController;
  late DateTime _fechaSeleccionada;

  @override
  void initState() {
    super.initState();
    _pacienteController = TextEditingController(text: widget.cita.paciente);
    _motivoController = TextEditingController(text: widget.cita.motivo);
    _telefonoController = TextEditingController(text: widget.cita.telefono);
    _fechaSeleccionada = widget.cita.fecha;
  }

  void _guardarEdicion() {
    if (_pacienteController.text.isEmpty || _motivoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    final citaEditada = Cita(
      paciente: _pacienteController.text,
      motivo: _motivoController.text,
      telefono: _telefonoController.text,
      fecha: _fechaSeleccionada,
    );

    Navigator.pop(context, citaEditada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar cita')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pacienteController,
              decoration: const InputDecoration(labelText: 'Nombre del paciente'),
            ),
            TextField(
              controller: _motivoController,
              decoration: const InputDecoration(labelText: 'Motivo'),
            ),
            TextField(
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Telefono'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _guardarEdicion,
              child: const Text('Guardar cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
