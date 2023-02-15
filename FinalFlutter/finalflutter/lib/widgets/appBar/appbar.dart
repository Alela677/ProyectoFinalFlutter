import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/productoscard.dart';
import '../game/game.dart';
import '../inicio/inicioview.dart';
import 'utilsappbar.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _AppBarState();
}

class _AppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(45),
          bottomLeft: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 13,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconOnTap(
            widget: const PantallaInicio(),
            widgeticon: IconAppBar(
              icon: Icons.home,
              texto: 'Inicio',
            ),
          ),
          IconOnTap(
            widget: const ProductoCard(),
            widgeticon: IconAppBar(
              icon: Icons.shopping_basket,
              texto: 'Shop',
            ),
          ),
          IconOnTap(
            widget: const GameWidget(),
            widgeticon: IconAppBar(
              icon: Icons.sports_esports,
              texto: 'Game',
            ),
          ),
        ],
      ),
    );
  }
}
