
import 'package:flutter/material.dart';
//import '../domus/domus_screen.dart'; // cambia esto por tu pantalla real

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(children: [_HeaderRow(), _ConnectionRow()]),
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),

          child: const Icon(Icons.data_object_rounded),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            'Flutter WebSockets',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        IconButton(
          onPressed: () {
            //TODo: cambiar a modo claro/oscuro
          },
          icon: const Icon(Icons.dark_mode_outlined),
        ),
      ],
    );
  }
}

class _ConnectionRow extends StatelessWidget {
  const _ConnectionRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // BADGE WS

        const SizedBox(height: 30),


        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Text(
            'WS',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(),
            //style: textStyles.titleMedium,
          ),
        ),

        const SizedBox(height: 30),

        // ROW central
        Row(
          children: [
            //MOVIL
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,

                borderRadius: BorderRadius.circular(20),
              ),

              child: Image.asset(
                '../assets/icon/movil.png',
                width: 40,
                height: 40,
              ),
            ),

            const Spacer(),

            // PUNTOS (imagen transparente)
            Image.asset('../assets/icon/puntos.png', width: 120),

            const Spacer(),

            // servidor
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,

                borderRadius: BorderRadius.circular(20),
              ),

              child: Image.asset(
                '../assets/icon/servidor.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
