import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(
        texto,
        style: GoogleFonts.amiko(color: Colors.black),
      ),
    );
  }
}
