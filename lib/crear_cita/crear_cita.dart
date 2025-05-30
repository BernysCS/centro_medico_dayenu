import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:centro_medico_dayenu/estilos/estilos.dart';
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

    widget.onCrearCita(nuevaCita);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.fondo,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _pacienteController,
              decoration: InputDecoration(
                labelText: 'Paciente',
                labelStyle: AppTextStyles.textoPrincipal,
                filled: true,
                fillColor: AppColors.rosa.withOpacity(0.1),
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
                fillColor: AppColors.fucsia.withOpacity(0.1),
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
                fillColor: AppColors.verde.withOpacity(0.1),
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
                onPressed: _crearCita,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azul,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                label: const Text(
                  'Crear cita',
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
