//En este archivo se mostrará todas las citas que se han creado
import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:centro_medico_dayenu/crear_cita/editar_cita.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  final List<Cita> citas;
  final Function(int) onEliminar;
  final Function(int, Cita) onEditar;
  final Function(int) onCambiarEstado;

  const PantallaPrincipal({
    super.key,
    required this.citas,
    required this.onEliminar,
    required this.onEditar,
    required this.onCambiarEstado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Citas programadas')),
      body:
          citas.isEmpty
              ? const Center(child: Text('No hay citas registradas'))
              : ListView.builder(
                itemCount: citas.length,
                itemBuilder: (context, index) {
                  final cita = citas[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: cita.enCurso ? Colors.lightGreen[100] : Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cita.paciente,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Motivo: ${cita.motivo}'),
                          Text(
                            'Fecha: ${cita.fecha.toLocal().toString().split(' ')[0]}',
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => onCambiarEstado(index),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      cita.enCurso
                                          ? Colors.green
                                          : Colors.grey[300],
                                ),
                                child: Text(
                                  cita.enCurso ? 'En curso' : 'Pendiente',
                                  style: TextStyle(
                                    color:
                                        cita.enCurso
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () async {
                                      final citaEditada = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => PantallaEditarCita(
                                                cita: cita,
                                              ),
                                        ),
                                      );
                                      if (citaEditada != null &&
                                          citaEditada is Cita) {
                                        onEditar(index, citaEditada);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () => onEliminar(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
