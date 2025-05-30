import 'package:flutter/material.dart';

class AppColors {
  static const Color rosa = Color(0xFFF599B0);
  static const Color azul = Color(0xFF41A2AE);
  static const Color verde = Color(0xFF579E93);
  static const Color fucsia = Color(0xFFE983B6);
  static const Color fondo = Colors.white;
  static const Color textoPrincipal = Color(0xFF333333);
}

class AppTextSizes {
  static const double tituloGrande = 32;
  static const double tituloSeccion = 24;
  static const double subtitulo = 18;
  static const double textoPrincipal = 16;
  static const double textoSecundario = 14;
  static const double textoPequeno = 12;
}

class AppTextStyles {
  static const TextStyle tituloGrande = TextStyle(
    fontSize: AppTextSizes.tituloGrande,
    fontWeight: FontWeight.bold,
    color: AppColors.textoPrincipal,
  );

  static const TextStyle tituloSeccion = TextStyle(
    fontSize: AppTextSizes.tituloSeccion,
    fontWeight: FontWeight.w600,
    color: AppColors.textoPrincipal,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: AppTextSizes.subtitulo,
    fontWeight: FontWeight.w500,
    color: AppColors.textoPrincipal,
  );

  static const TextStyle textoPrincipal = TextStyle(
    fontSize: AppTextSizes.textoPrincipal,
    fontWeight: FontWeight.normal,
    color: AppColors.textoPrincipal,
  );

  static const TextStyle textoSecundario = TextStyle(
    fontSize: AppTextSizes.textoSecundario,
    fontWeight: FontWeight.normal,
    color: AppColors.textoPrincipal,
  );

  static const TextStyle textoPequeno = TextStyle(
    fontSize: AppTextSizes.textoPequeno,
    fontWeight: FontWeight.w400,
    color: AppColors.textoPrincipal,
  );
}
