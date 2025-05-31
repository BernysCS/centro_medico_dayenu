import 'package:centro_medico_dayenu/estilos/estilos.dart';
import 'package:flutter/material.dart';

class PantallaReportes extends StatelessWidget {
  const PantallaReportes({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> datos = {
      'Total citas': '142',
      'Citas canceladas': '15',
      'Ingresos': 'Lps 2,340',
    };

    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: AppColors.fucsia.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              elevation: 6,
              color: Colors.white,
              shadowColor: AppColors.fucsia.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Column(
                  children:
                      datos.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: AppTextStyles.subtitulo.copyWith(
                                  color: AppColors.textoPrincipal,
                                ),
                              ),
                              Text(
                                entry.value,
                                style: AppTextStyles.subtitulo.copyWith(
                                  color: AppColors.rosa,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Actualizado: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
              style: AppTextStyles.textoPequeno.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColors.verde,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
