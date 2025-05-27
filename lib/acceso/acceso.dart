import 'package:flutter/material.dart';
import 'package:centro_medico_dayenu/navegacion.dart';

/// Punto de entrada principal de la aplicación
void main() => runApp(const MyApp());

/// Widget principal que configura la aplicación MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Oculta la banda de debug
      home: const LoginScreen(),          // Establece LoginScreen como pantalla inicial
    );
  }
}

/// Pantalla de inicio de sesión que maneja la autenticación del usuario
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// Estado de la pantalla de login que maneja la lógica de autenticación
class _LoginScreenState extends State<LoginScreen> {
  // Controladores para los campos de texto
  final _userController = TextEditingController();  // Controlador para campo de usuario
  final _passController = TextEditingController();  // Controlador para campo de contraseña
  String _error = '';  // Almacena mensajes de error

  /// Método que valida las credenciales y realiza el login
  void _login() {
    // Verifica credenciales (usuario: admin, contraseña: 1234)
    if (_userController.text.trim() == 'admin' && _passController.text == '1234') {
      // Navega a la pantalla principal si las credenciales son correctas
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const Navegacion()),  
      );
    } else {
      // Muestra mensaje de error si las credenciales son incorrectas
      setState(() => _error = 'Usuario o contraseña incorrectos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,  // Ancho fijo para el contenedor del formulario
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Columna ocupa solo espacio necesario
            children: [
              // Título del formulario
              const Text('Iniciar Sesión', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),  // Espaciado
              
              // Campo de texto para usuario
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),  // Borde tipo outline
                ),
              ),
              const SizedBox(height: 15),  // Espaciado
              
              // Campo de texto para contraseña
              TextField(
                controller: _passController,
                obscureText: true,  // Oculta texto para contraseña
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),  // Espaciado
              
              // Botón de login
              SizedBox(
                width: double.infinity,  // Ocupa todo el ancho disponible
                child: ElevatedButton(
                  onPressed: _login,  // Ejecuta método _login al presionar
                  child: const Text('Ingresar'),
                ),
              ),
              
              // Muestra mensaje de error si existe
              if (_error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(_error, style: const TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}