import 'package:finalflutter/widgets/appBar/utilsappbar.dart';
import 'package:finalflutter/widgets/game/puntuacionplayer.dart';
import 'package:flutter/material.dart';
import '../api/productoscard.dart';
import '../inicio/inicioview.dart';

// Widget que utilizamos para navegar entre la diferente vista de la aplicacion y una opcion que solo contiene la vista game
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
          // Iconon que nos muestra los resultado de todos los partipantes del juego de las ofertas
          IconOnTap(
            widget: const PuntosPlayer(),
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
