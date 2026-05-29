import 'dart:math';

import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 240),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 240),
          elevation: 0,
        ),

        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _EnergyHeader(),
              SizedBox(height: 20),
              _EnergyCard(),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------
// HEADER
//-----------------------------------------------------

class _EnergyHeader extends StatelessWidget {
  const _EnergyHeader();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color.fromARGB(255, 200, 230, 210),
              child: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 26, 100, 82),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome César',
                  style: textStyles.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Tu energía del hogar en tus manos',
                  style: textStyles.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),

        const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}

//-----------------------------------------------------
// ENERGY CARD
//-----------------------------------------------------

class _EnergyCard extends StatefulWidget {
  const _EnergyCard();

  @override
  State<_EnergyCard> createState() => _EnergyCardState();
}

class _EnergyCardState extends State<_EnergyCard> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  late List<CircularStackEntry> _chartData;

  @override
  void initState() {
    super.initState();

    final random = Random();

    final valores = [
      random.nextDouble() * 100,
      random.nextDouble() * 100,
      random.nextDouble() * 100,
      random.nextDouble() * 100,
    ];

    final colores = [
      const Color.fromARGB(255, 55, 110, 80),
      const Color.fromARGB(255, 255, 162, 41),
      const Color.fromARGB(255, 228, 144, 221),
      const Color.fromARGB(255, 78, 111, 253),
    ];

    _chartData = List.generate(4, (i) {
      return CircularStackEntry(
        [
          CircularSegmentEntry(
            valores[i],
            colores[i],
            rankKey: 'activo_$i',
          ),
          CircularSegmentEntry(
            100 - valores[i],
            const Color.fromARGB(255, 236, 236, 236),
            rankKey: 'fondo_$i',
          ),
        ],
        rankKey: 'anillo_$i',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //-----------------------------------------------------
            // CHART
            //-----------------------------------------------------

            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedCircularChart(
                  key: _chartKey,
                  size: const Size(330, 330),
                  initialChartData: _chartData,
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeRadius: 130,
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2,4kW',
                      style: textStyles.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Potencia actual',
                      style: textStyles.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            //-----------------------------------------------------
            // BADGE
            //-----------------------------------------------------

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 100, 82),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '● CONECTADO',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 24),

            //-----------------------------------------------------
            // BLOQUE DISPOSITIVOS + SEGUNDO CARD
            //-----------------------------------------------------

            Column(
              children: [
                //-------------------------------------------------
                // DISPOSITIVOS
                //-------------------------------------------------

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dispositivos',
                        style: textStyles.labelMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 25),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _IconoDispositivo(
                              icono: Icons.wb_sunny_outlined,
                              titulo: 'Solar',
                              subtitulo: '1.2 kW',
                              color: Color.fromARGB(255, 255, 162, 41),
                            ),
                            SizedBox(width: 25),
                            _IconoDispositivo(
                              icono: Icons.bolt,
                              titulo: 'Red',
                              subtitulo: '0.8 kW',
                              color: Color.fromARGB(255, 55, 110, 80),
                            ),
                            SizedBox(width: 25),
                            _IconoDispositivo(
                              icono: Icons.home_outlined,
                              titulo: 'Hogar',
                              subtitulo: '2.4 kW',
                              color: Color.fromARGB(255, 78, 111, 253),
                            ),
                            SizedBox(width: 25),
                            _IconoDispositivo(
                              icono: Icons.power_outlined,
                              titulo: 'Enchufe',
                              subtitulo: '0.4 kW',
                              color: Color.fromARGB(255, 228, 144, 221),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //-------------------------------------------------
                // SEGUNDO CARD
                //-------------------------------------------------

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------
// ICONO DISPOSITIVO
//-----------------------------------------------------

class _IconoDispositivo extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final Color color;

  const _IconoDispositivo({
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: color, size: 28),
          const SizedBox(height: 10),
          Text(
            titulo,
            style: textStyles.bodySmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitulo,
            style: textStyles.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}