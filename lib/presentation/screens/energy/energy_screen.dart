import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_d_pie_chart/three_d_pie_chart.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [_EnergyHeader(), SizedBox(height: 20), _EnergyCard()],
          ),
        ),
      ),
    );
  }
}

class _EnergyHeader extends StatelessWidget {
  const _EnergyHeader();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Buenas tardes', style: textStyles.bodySmall),
            const SizedBox(height: 4),
            Text(
              'Zona Salón',
              style: textStyles.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),

        CircleAvatar(
          radius: 22,
          backgroundColor: Color.fromARGB(255, 238, 236, 238),
          child: Text(
            'CS',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}

class _EnergyCard extends StatelessWidget {
  const _EnergyCard();

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 236),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BADGE CONECTADO
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 100, 82),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '● CONECTADO',
              style: textStyles.labelSmall?.copyWith(color: Colors.white),
            ),
          ),

          const SizedBox(height: 1),

          // ESPACIO PARA GRÁFICO (LO METEMOS DESPUÉS)
          ThreeDPieChart(
            segments: [
              PieChartSegment(
                label: 'Large Cap',
                value: 65,
                color: Color.fromARGB(255, 154, 236, 107),
              ),
              PieChartSegment(
                label: 'Mid Cap',
                value: 25,
                color: Color.fromARGB(255, 255, 162, 41),
              ),
              PieChartSegment(
                label: 'Small Cap',
                value: 10,
                color: Color.fromARGB(255, 228, 144, 221),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // POTENCIA
          Text('Potencia actual', style: textStyles.bodySmall),

          const SizedBox(height: 5),

          Text(
            '2.4 kW',
            style: textStyles.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
