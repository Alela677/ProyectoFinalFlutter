import 'package:flutter/material.dart';

import '../api/productoscard.dart';
import '../game/game.dart';
import '../inicio/inicioview.dart';
import 'utilsappbar.dart';

// Widget que utilizamos para navegar entre la diferente vista de la aplicacion
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
          // Icono home nos lleva a la vista principal de la aplicacion
          IconOnTap(
            widget: const PantallaInicio(),
            widgeticon: IconAppBar(
              icon: Icons.home,
              texto: 'Inicio',
            ),
          ),
          // Icono shop nos lleva a la vista donde se encuentra el catalogo de productos de la aplicacion
          IconOnTap(
            widget: const ProductoCard(),
            widgeticon: IconAppBar(
              icon: Icons.shopping_basket,
              texto: 'Shop',
            ),
          ),
          // Icono game que nos lleva al jeugo de las ofertas
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
