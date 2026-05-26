import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../domus/domus_screen.dart'; // cambia esto por tu pantalla real

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              _HeaderRow(
                estTenebrisModus: estTenebrisModus,
                onToggle: () {
                  ref.read(estTenebrisModusProvider.notifier).state =
                      !estTenebrisModus;
                },
              ),
              _ConnectionRow(),
              _InfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final bool estTenebrisModus;
  final VoidCallback onToggle;

  const _HeaderRow({required this.estTenebrisModus, required this.onToggle});

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
          child: Text('Flu Avm', style: Theme.of(context).textTheme.titleLarge),
        ),

        IconButton(
          onPressed: onToggle,
          icon: Icon(
            estTenebrisModus
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
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

class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: 80),

        // BADGE CONECTADO
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 98, 192, 101),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Text(
            '● CONECTADO',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(),
          ),
        ),

        const SizedBox(height: 20),

        // TITULO
        Text(
          'WebSockets en vivo',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        const SizedBox(height: 12),

        // DESCRIPCIÓN
        Text(
          'Aprende a construir apps con datos en tiempo real en Flutter. Dos ejemplos prácticos te esperan dentro.',
          style: textStyles.bodyMedium,
        ),
      ],
    );
  }
}
