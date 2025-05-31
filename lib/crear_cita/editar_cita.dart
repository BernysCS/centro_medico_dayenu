import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:centro_medico_dayenu/estilos/estilos.dart';
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
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        title: const Text('Editar cita'),
        backgroundColor: AppColors.azul,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _pacienteController,
              decoration: InputDecoration(
                labelText: 'Paciente',
                labelStyle: AppTextStyles.textoPrincipal,
                filled: true,
                fillColor: AppColors.rosa.withAlpha(26),
                prefixIcon: const Icon(Icons.person, color: AppColors.rosa),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.rosa),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _motivoController,
              decoration: InputDecoration(
                labelText: 'Motivo',
                labelStyle: AppTextStyles.textoPrincipal,
                filled: true,
                fillColor: AppColors.fucsia.withAlpha(26),
                prefixIcon: const Icon(Icons.edit_note, color: AppColors.fucsia),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.fucsia),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _telefonoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                labelStyle: AppTextStyles.textoPrincipal,
                filled: true,
                fillColor: AppColors.verde.withAlpha(26),
                prefixIcon: const Icon(Icons.phone, color: AppColors.verde),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.verde),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _guardarEdicion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azul,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Guardar cambios',
                  style: TextStyle(fontSize: AppTextSizes.textoPrincipal, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
