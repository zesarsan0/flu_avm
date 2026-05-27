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
              const SizedBox(height: 40),
              _CardsSection(),
              const SizedBox(height: 7),
              _StatsRow(),
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

class _CardsSection extends StatelessWidget {
  const _CardsSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FeatureCard(
            title: 'Mapas',
            subtitle: 'Ubicación en tiempo real',
            imagePath: '../assets/images/mapa.jpg',
          ),
        ),
        const SizedBox(width: 8),

        Expanded(
          child: _FeatureCard(
            title: 'Votaciones',
            subtitle: 'Gráfico que se actualiza',
            imagePath: '../assets/images/votaciones.jpg',
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),

        child: Column(
          children: [
            // IMAGEN
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(title, style: textStyles.titleMedium),

            const SizedBox(height: 8),

            Text(
              subtitle,
              style: textStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatResume(number: '5', label: "PANTALLAS"),
        const SizedBox(width: 8),
        _StatResume(number: '2', label: "WEBSOCKETS"),
        const SizedBox(width: 8),
        _StatResume(number: 'CS', label: "CÉSAR SOTO"),
      ],
    );
  }
}

class _StatResume extends StatelessWidget {
  final String number;
  final String label;

  const _StatResume({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 7),

      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(number, style: textStyles.titleMedium),

          const SizedBox(height: 1),

          Text(label, style: textStyles.labelSmall),
        ],
      ),
    );
  }
}
