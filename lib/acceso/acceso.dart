import 'package:flutter/material.dart';
import 'package:centro_medico_dayenu/navegacion.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _error = '';
  
  // --- AÑADIDO: Nuevas variables para el tipo de usuario ---
  String? _selectedUserType; // 'admin', 'doctor', 'recepcionista'
  final List<String> _userTypes = ['admin', 'doctor', 'recepcionista'];

  void _login() {
    // --- MODIFICADO: Validar tipo de usuario ---
    if (_userController.text.trim() == 'admin' && 
        _passController.text == '1234' &&
        _selectedUserType != null) {
      
      // --- AÑADIDO: Pasar tipo de usuario a Navegacion (sin modificar navegacion.dart) ---
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (_) => Navegacion(tipoUsuario: _selectedUserType!), // <-- Aquí se pasa
        ),
      );
    } else {
      setState(() => _error = 'Completa todos los campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Iniciar Sesión', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              
              TextField(
                controller: _passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // --- AÑADIDO: Selector de tipo de usuario ---
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                items: _userTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedUserType = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Tipo de Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Ingresar'),
                ),
              ),
              
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