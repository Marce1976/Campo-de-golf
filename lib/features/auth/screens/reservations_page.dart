import 'package:flutter/material.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reservas'),
      ),
      body: const Center(
        child: Text(
          'Aquí aparecerán tus reservas',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
