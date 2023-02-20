// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Esta clase contiene algunos widget que utilizamos en la clase appbar y appbargame

// Widget que muestra un icono y un texto que pasamos como parametro
class IconAppBar extends StatelessWidget {
  IconAppBar({super.key, required this.icon, required this.texto});
  final IconData icon;
  late String texto;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        Text(
          texto,
          style: GoogleFonts.abel(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}

//  Widget que aplica la logica a cada icono que pulsamos
//  en esta caso nos redirige a la vista que pasamos por parametro
class IconOnTap extends StatelessWidget {
  IconOnTap({super.key, required this.widget, required this.widgeticon});
  Widget widgeticon;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widgeticon,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
      },
    );
  }
}
