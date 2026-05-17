import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/widgets.dart';


class ChartaScreen extends StatefulWidget {
  const ChartaScreen({super.key});

  @override
  State<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends State<ChartaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
      ),
body:Stack(
  fit: StackFit.expand,
  children: [
    ColoredBox(
      color: Colors.blueGrey,
      child: Center(
        child:Text(
          'Mapa a pantalla completa',
          style: TextStyle(color: Colors.white)
        ),
        ),
      ),
      const Align (
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: ComplereForm()
          ),
      )
  ]
  )

    );
  }
}