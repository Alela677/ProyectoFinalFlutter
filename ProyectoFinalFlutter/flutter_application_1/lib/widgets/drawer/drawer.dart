import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer/utilsdrawer.dart';

import '../api/electronics.dart';
import '../api/jewelery.dart';
import '../api/menclothing.dart';
import '../api/productoscard.dart';
import '../api/womenclothing.dart';

class DrawerInicio extends StatelessWidget {
  const DrawerInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://img.icons8.com/plasticine/400/aliexpress--v1.png'),
            ),
          ),
          ExpansionTile(
            title: const Text("Productos"),
            children: <Widget>[
              Ink(
                width: 250,
                child: MenuItemDrawer(
                  texto: 'Todos los productos',
                  page: const ProductoCard(),
                ),
              ),
              ExpansionTile(
                title: const Text('Categoria'),
                children: [
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Jewelery',
                      page: const JeweleryCard(),
                    ),
                  ),
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Electronic',
                      page: const ElectronicCard(),
                    ),
                  ),
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                        texto: 'Men\'s clothing',
                        page: const MenClothingCard()),
                  ),
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Women\'s clothing',
                      page: const WomenClothingCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
