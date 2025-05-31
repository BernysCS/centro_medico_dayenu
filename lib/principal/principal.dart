import 'package:centro_medico_dayenu/crear_cita/cita.dart';
import 'package:centro_medico_dayenu/crear_cita/editar_cita.dart';
import 'package:flutter/material.dart';
import 'package:centro_medico_dayenu/estilos/estilos.dart';

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
      backgroundColor: AppColors.fondo,
      body:
          citas.isEmpty
              ? const Center(
                child: Text(
                  'No hay citas registradas',
                  style: AppTextStyles.subtitulo,
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: citas.length,
                itemBuilder: (context, index) {
                  final cita = citas[index];
                  final bool enCurso = cita.enCurso;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.fondo,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: enCurso ? AppColors.verde : AppColors.fucsia,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                cita.paciente,
                                style: AppTextStyles.tituloSeccion.copyWith(
                                  color: AppColors.azul,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    enCurso
                                        ? Icons.check_circle
                                        : Icons.schedule,
                                    color:
                                        enCurso
                                            ? AppColors.verde
                                            : AppColors.fucsia,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    enCurso ? 'En curso' : 'Pendiente',
                                    style: AppTextStyles.textoSecundario
                                        .copyWith(
                                          color:
                                              enCurso
                                                  ? AppColors.verde
                                                  : AppColors.fucsia,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Motivo: ${cita.motivo}',
                            style: AppTextStyles.textoPrincipal.copyWith(
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Fecha: ${cita.fecha.toLocal().toString().split(' ')[0]}',
                            style: AppTextStyles.textoSecundario.copyWith(
                              color: AppColors.textoPrincipal,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => onCambiarEstado(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      enCurso
                                          ? AppColors.verde
                                          : AppColors.fucsia,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                ),
                                child: Text(
                                  enCurso ? 'En curso' : 'Pendiente',
                                  style: AppTextStyles.textoPrincipal.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: AppColors.azul,
                                    tooltip: 'Editar cita',
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
                                    icon: const Icon(Icons.delete),
                                    color: AppColors.rosa,
                                    tooltip: 'Eliminar cita',
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
