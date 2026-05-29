import 'dart:math';
import 'package:go_router/go_router.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          elevation: 0,
        ),

        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _EnergyHeader(),
              SizedBox(height: 30),
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
              backgroundImage: const AssetImage('../assets/images/perfil.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'César Soto',
                  style: textStyles.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
              
                Text(
                  '29.05.2026',
                  style: textStyles.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
       

       IconButton(
        onPressed: (){
          context.push('/notis');
        },
        icon: const CircleAvatar(
          radius: 22,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: 
          
          Icon(Icons.notifications_outlined),
          
          
        ),
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
     const Color.fromARGB(255, 136, 214, 84),
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

               Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(
      Icons.bolt,
      color: Color.fromARGB(255, 0, 0, 0),
      size: 32,
    ),
    const SizedBox(width: 2),
    Text(
      '2,4kW',
      style: textStyles.headlineLarge?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 40,
      ),
    ),
  ],
),
              ],
            ),

            const SizedBox(height: 15),

            Column(
  children: [
    Text(
      '4h 30min',
      style: textStyles.headlineSmall?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),

    const SizedBox(height: 1),

    Text(
      'Horas de uso optimizado',
      style: textStyles.bodySmall?.copyWith(
        color: Colors.grey,
      ),
    ),
  ],
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

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(width: 4),
                            _IconoDispositivo(
                              icono: Icons.wb_sunny_outlined,
                              titulo: 'Solar',
                              subtitulo: '1.2 kW',
                              color: Color.fromARGB(255, 255, 162, 41),
                            ),
                            SizedBox(width: 30),
                            _IconoDispositivo(
                              icono: Icons.bolt,
                              titulo: 'Red',
                              subtitulo: '0.8 kW',
                              color: Color.fromARGB(255, 55, 110, 80),
                            ),
                            SizedBox(width: 30),
                            _IconoDispositivo(
                              icono: Icons.home_outlined,
                              titulo: 'Hogar',
                              subtitulo: '2.4 kW',
                              color: Color.fromARGB(255, 136, 214, 84),
                            ),
                            SizedBox(width: 30),
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

                const SizedBox(height: 8),

                //-------------------------------------------------
                // SEGUNDO CARD
                //-------------------------------------------------

                Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [

      // TÍTULO PEQUEÑO
      Text(
        'Consumo diario',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
    fontWeight: FontWeight.w800,
    color: Colors.black,
        ),
      ),

      const SizedBox(height: 1),

      // GRÁFICO
      SizedBox(
        height: 155,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          primaryYAxis: NumericAxis(isVisible: false),
          plotAreaBorderWidth: 0,

          series: <CartesianSeries>[
            ColumnSeries<Map<String, dynamic>, String>(
              dataSource: const [
                {'x': 'Lun', 'y': 30, 'color': Color.fromARGB(99, 219, 219, 218)},
                {'x': 'Mar', 'y': 40, 'color': Color.fromARGB(255, 255, 162, 41)},
                {'x': 'Mié', 'y': 25, 'color': Color.fromARGB(99, 219, 219, 218)},
                {'x': 'Jue', 'y': 50, 'color': Color.fromARGB(99, 219, 219, 218)},
                {'x': 'Vie', 'y': 35, 'color': Color.fromARGB(99, 219, 219, 218)},
              ],
              xValueMapper: (data, _) => data['x'],
              yValueMapper: (data, _) => data['y'],
              pointColorMapper: (data, _) => data['color'],
              width: 0.9,
             borderRadius: BorderRadius.circular(4),

            ),
          ],
        ),
      ),
    ],
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