import 'package:campo_de_golf/features/auth/screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos una variable para la transparencia y no repetir código
    final Color glassColor = Colors.white.withOpacity(0.2); 
    final Color glassBorder = Colors.white.withOpacity(0.3);

    return Scaffold(
      backgroundColor: const Color(0xFF6BB062), // Tu verde de fondo
      body: SafeArea(
        child: SingleChildScrollView( // Añadido para que no de error al subir el teclado
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                // --- BOTÓN VOLVER TRANSPARENTE ---
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: glassColor, // Transparente
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: glassBorder), // Borde sutil
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  "Bienvenido \nde vuelta",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1a1a2e),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Inicia sesión en tu cuenta',
                  style: TextStyle(fontSize: 13, color: Color(0xFF1a1a2e)),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Correo electrónico',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1a1a2e),
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 8),
                // --- CAMPO CORREO TRANSPARENTE ---
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white), // Texto blanco al escribir
                  decoration: InputDecoration(
                    hintText: 'tucorreo@ejemplo.com',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                    filled: true,
                    fillColor: glassColor, // Fondo transparente
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: glassBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Contraseña',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1a1a2e),
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 8),
                // --- CAMPO CONTRASEÑA TRANSPARENTE ---
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu contraseña',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                    filled: true,
                    fillColor: glassColor, // Fondo transparente
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: glassBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1a1a2e),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // BOTÓN PRINCIPAL
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1a1a2e),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Iniciar sesión', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                // SEPARADOR
                Row(
                  children: [
                    const Expanded(child: Divider(color: Colors.black26)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'o continúa con',
                        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                    const Expanded(child: Divider(color: Colors.black26)),
                  ],
                ),
                const SizedBox(height: 20),
                // BOTONES SOCIALES TRANSPARENTES
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: glassColor,
                          foregroundColor: const Color(0xFF1a1a2e),
                          side: BorderSide(color: glassBorder),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Google'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: glassColor,
                          foregroundColor: const Color(0xFF1a1a2e),
                          side: BorderSide(color: glassBorder),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Facebook'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
  child: TextButton(
    onPressed: () {
      // Cerramos Login y abrimos Registro
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    },
    child: RichText(
      text: const TextSpan(
        text: '¿No tienes cuenta? ',
        style: TextStyle(color: Colors.black54, fontSize: 13),
        children: [
          TextSpan(
            text: 'Regístrate',
            style: TextStyle(
              color: Color(0xFF1a1a2e), // Tu azul oscuro de TeeUp
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    ),
  ),
),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}