import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotisScreen extends StatelessWidget {
  const NotisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          elevation: 0,

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Assign new team',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Gestiona todas los usuarios del equipo hogar',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 60),

              const _NotiCard(
                texto: 'César',
              ),

              SizedBox(height: 10),

              const _NotiCard(
                texto: 'Blanca',
              ),

              SizedBox(height: 10),

              const _NotiCard(
                texto: 'Enrique',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------
// TARJETA NOTIFICACIÓN
//-----------------------------------------------------

class _NotiCard extends StatelessWidget {
  final String texto;

  const _NotiCard({
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color.fromARGB(
              255,
              200,
              230,
              210,
            ),
            child: Icon(
              Icons.person,
              size: 18,
              color: Color.fromARGB(255, 26, 100, 82),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}