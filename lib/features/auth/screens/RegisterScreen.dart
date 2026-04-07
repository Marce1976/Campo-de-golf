import 'package:campo_de_golf/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color glassColor = Colors.white.withOpacity(0.2);
    final Color glassBorder = Colors.white.withOpacity(0.3);

    return Scaffold(
      backgroundColor: const Color(0xFF6BB062), // Fondo verde TeeUp
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Botón volver
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Crea tu cuenta",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1a1a2e),
                  ),
                ),
                const Text(
                  'Únete a la comunidad de TeeUp',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                
                // CAMPO NOMBRE
                _buildLabel("Nombre completo"),
                _buildTextField("Ej. Tiger Woods", glassColor, glassBorder),
                
                const SizedBox(height: 20),
                
                // CAMPO EMAIL
                _buildLabel("Correo electrónico"),
                _buildTextField("tu@email.com", glassColor, glassBorder),

                const SizedBox(height: 20),

                // CAMPO CONTRASEÑA
                _buildLabel("Contraseña"),
                _buildTextField("Mínimo 8 caracteres", glassColor, glassBorder, isPassword: true),

                const SizedBox(height: 32),

                // BOTÓN REGISTRARSE
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1a1a2e),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Registrarse ahora', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                
                const SizedBox(height: 24),
                Center(
  child: TextButton(
    onPressed: () {
      // Usamos pushReplacement para que, si el usuario vuelve atrás,
      // no se quede atrapado en un bucle entre registro y login.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    },
    child: RichText(
      text: const TextSpan(
        text: '¿Ya tienes cuenta? ',
        style: TextStyle(color: Colors.black54, fontSize: 13),
        children: [
          TextSpan(
            text: 'Inicia sesión',
            style: TextStyle(
              color: Color(0xFF1a1a2e),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline, // Un toque visual de link
            ),
          ),
        ],
      ),
    ),
  ),
),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para no repetir código de etiquetas
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1a1a2e)),
      ),
    );
  }

  // Widget auxiliar para los campos transparentes
  Widget _buildTextField(String hint, Color fill, Color border, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        filled: true,
        fillColor: fill,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}