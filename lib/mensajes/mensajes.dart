// en este archivo se agregá una opción para crear y enviar mensajes
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      home: PantallaMensajes(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class PantallaMensajes extends StatefulWidget {
  const PantallaMensajes({super.key});

  @override
  State<PantallaMensajes> createState() => _PantallaMensajesState();
}

class _PantallaMensajesState extends State<PantallaMensajes> {
  final TextEditingController _mensajeController = TextEditingController();
  String? _mensajeSeleccionado;

  final List<String> _mensajesPreestablecidos = [
    "Te saludamos desde centro medico Dayenú.",
    "Buen día, no olvide asistir a su control médico esta semana.",
    "¿Sabía que dormir 8 horas mejora su sistema inmunológico?.",
  ];

  Future<void> _abrirWhatsApp(String mensaje) async {
    final url = Uri.parse(
      "https://wa.me/?text=${Uri.encodeComponent(mensaje)}",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Error al abrir WhatsApp")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 34),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mensajes rápidos:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Seleccione un mensaje predefinido para enviar:",
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mensajesPreestablecidos.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final mensaje = _mensajesPreestablecidos[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          title: Text(
                            mensaje,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                          onTap: () {
                            setState(() {
                              _mensajeSeleccionado = mensaje;
                              _mensajeController.text = mensaje;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _mensajeController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Mensaje personalizado",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final mensaje = _mensajeController.text.trim();
                      if (mensaje.isNotEmpty) {
                        _abrirWhatsApp(mensaje);
                      }
                    },
                    icon: const Icon(Icons.send),
                    label: const Text(
                      "Enviar por WhatsApp",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
