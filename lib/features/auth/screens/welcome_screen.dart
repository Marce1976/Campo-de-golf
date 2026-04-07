import 'package:campo_de_golf/features/auth/screens/RegisterScreen.dart';
import 'package:campo_de_golf/features/auth/screens/reservations_Screen.dart';
import 'package:flutter/material.dart';
import 'package:campo_de_golf/features/auth/screens/login_screen.dart';

// --- EL PINTOR DEL GREEN CON BANDERÍN ---
class GolfGreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final greenColor = const Color(0xFF6BB062); 
    final goldColor = const Color(0xFFe8c547); 

    // 1. DIBUJAMOS EL GREEN (Los niveles de la hierba)
    canvas.drawCircle(center, size.width * 0.45, Paint()..color = greenColor.withOpacity(0.15));
    canvas.drawCircle(center, size.width * 0.30, Paint()..color = greenColor.withOpacity(0.30));
    canvas.drawCircle(center, size.width * 0.15, Paint()..color = greenColor.withOpacity(0.45));
    
    // 2. EL HOYO
    canvas.drawCircle(center, 12, Paint()..color = const Color(0xFF1a1a2e));

    // 3. EL MÁSTIL (Blanco sutil)
    final mastilPaint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(center.dx, center.dy - 10), 
      Offset(center.dx, center.dy - 100), // Lo hacemos un pelín más alto
      mastilPaint
    );

    // 4. LA BANDERA (Triangular y dorada)
    final banderaPath = Path();
    banderaPath.moveTo(center.dx + 2, center.dy - 100); 
    banderaPath.lineTo(center.dx + 45, center.dy - 82); 
    banderaPath.lineTo(center.dx + 2, center.dy - 65); 
    banderaPath.close();

    final banderaPaint = Paint()
      ..color = goldColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(banderaPath, banderaPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: Stack(
        children: [
          // GREEN Y BANDERÍN DE FONDO
          Positioned(
            top: -100, // Ajustado para que se vea el banderín
            right: -80,
            child: CustomPaint(
              size: const Size(450, 450),
              painter: GolfGreenPainter(),
            ),
          ),

          // CONTENIDO PRINCIPAL
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'TeeUp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5,
                    ),
                  ),
                  const Text(
                    'Tu club de golf en un clic',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                  const Spacer(),
                  
                  // SECCIÓN CENTRAL INTERACTIVA (Lleva a Reservas)
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReservationsScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Icon(
                                Icons.sports_golf_outlined,
                                size: 80,
                                color: Color(0xFFe8c547),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.calendar_today_outlined, color: Colors.white70, size: 14),
                                SizedBox(width: 8),
                                Text(
                                  'Tus reservas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                  // BOTONES
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFe8c547),
                      foregroundColor: const Color(0xFF1a1a2e),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Crear cuenta', 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white30),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Iniciar sesión', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}