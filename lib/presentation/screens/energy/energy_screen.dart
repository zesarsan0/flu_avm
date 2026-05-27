import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Column(children: [_EnergyHeader()]),
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

        CircleAvatar(radius: 22, child: Text('CS')),
      ],
    );
  }
}
