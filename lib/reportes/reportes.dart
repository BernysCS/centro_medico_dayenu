import 'package:flutter/material.dart';

class PantallaReportes extends StatelessWidget {
  const PantallaReportes({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo 
    final Map<String, String> datos = { //Se declara este mapa , donde las claves y valores son de tipo string.
      'Pacientes': '142',
      'Citas hoy': '15',
      'Ingresos': '\Lps2,340',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
       
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                
                  children: datos.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(entry.key),
                          ),
                          Text(
                            entry.value,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            
       //Pie de pagina
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                'Actualizado: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}