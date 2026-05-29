import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotisScreen extends StatelessWidget {
  const NotisScreen({super.key});

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

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
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
                      fontWeight: FontWeight.w700,
                    ),
              ),

              const SizedBox(height: 4),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gestiona todas los usuarios del equipo Salón hogar',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: const [
                      Icon(
                        Icons.chair_outlined,
                        size: 35,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 60),

              const _NotiCard(
                texto: 'César',
                esUsuario: true,
              ),

              const SizedBox(height: 10),

              const _NotiCard(
                texto: 'Blanca',
                icono: Icons.person,
              ),

              const SizedBox(height: 10),

              const _NotiCard(
                texto: 'Enrique',
                icono: Icons.person,
              ),

              // BOTÓN +
              const SizedBox(height: 20),

              Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.6,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------
// CARD NOTIFICACIÓN
//-----------------------------------------------------

class _NotiCard extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final bool esUsuario;

  const _NotiCard({
    required this.texto,
    this.icono,
    this.esUsuario = false,
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
          //--------------------------------------------------
          // AVATAR
          //--------------------------------------------------

          CircleAvatar(
            radius: 18,
            backgroundColor: const Color.fromARGB(100, 228, 144, 221),

            child: esUsuario
                ? const CircleAvatar(
                    radius: 16,
                    backgroundImage:
                        AssetImage('../assets/images/perfil.png'),
                  )
                : Icon(
                    icono ?? Icons.notifications,
                    size: 18,
                    color: const Color.fromARGB(255, 228, 144, 221),
                  ),
          ),

          const SizedBox(width: 12),

          //--------------------------------------------------
          // TEXTO
          //--------------------------------------------------

          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //--------------------------------------------------
          // BOTÓN X
          //--------------------------------------------------

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