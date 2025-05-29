class Cita {
  final String paciente;
  final DateTime fecha;
  final String motivo;
  final String telefono;
  bool enCurso;

  Cita({
    required this.paciente,
    required this.fecha,
    required this.motivo,
    required this.telefono,
    this.enCurso = false,
  });
}
