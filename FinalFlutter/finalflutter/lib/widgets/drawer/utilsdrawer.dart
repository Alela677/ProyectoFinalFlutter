import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Esta clase contiene algunos widgets que utilizamos en el drawer de la vista shop

// Widget que utilizamos para asignar un nombre y una accion a cada opcion del drawer
// ignore: must_be_immutable
class MenuItemDrawer extends StatelessWidget {
  MenuItemDrawer({super.key, required this.texto, required this.page});

  late String texto;
  // ignore: prefer_typing_uninitialized_variables
  late var page;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Al prsionar nos redirige hacia lsi vista que introducimos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      // Texto que muestra el widget en el drawer
      child: Text(
        texto,
        style: GoogleFonts.amiko(color: Colors.black),
      ),
    );
  }
}
