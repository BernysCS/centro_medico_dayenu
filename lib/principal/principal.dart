//En este archivo se mostrará todas las citas que se han creado
import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  final List<Cita> citas;

  const PantallaPrincipal({super.key, required this.citas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: citas.length,
      itemBuilder: (context, index) {
        final cita = citas[index];
        return ListTile(
          title: Text(cita.paciente),
          subtitle: Text('${cita.motivo} - ${cita.fecha}'),
        );
      },
    );
  }
}

