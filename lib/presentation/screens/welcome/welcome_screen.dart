import 'package:flutter/material.dart';
import '../domus/domus_screen.dart'; // cambia esto por tu pantalla real

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Ir a la app"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DomusScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}