import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/productoscard.dart';

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
