import 'package:finalflutter/widgets/appBar/utilsappbar.dart';
import 'package:finalflutter/widgets/game/puntuacionplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/productoscard.dart';
import '../game/game.dart';
import '../inicio/inicioview.dart';

class MyAppBarGame extends StatefulWidget {
  const MyAppBarGame({super.key});

  @override
  State<MyAppBarGame> createState() => _AppBarState();
}

class _AppBarState extends State<MyAppBarGame> {
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
            widget: PuntosPlayer(),
            widgeticon: IconAppBar(
              icon: Icons.list_alt,
              texto: 'Top',
            ),
          ),
        ],
      ),
    );
  }
}
