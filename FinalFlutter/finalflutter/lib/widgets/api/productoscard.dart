import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/producto.dart';
import '../card/listacard.dart';
import '../drawer/drawer.dart';
import '../inicio/inicioview.dart';

class ProductoCard extends StatefulWidget {
  const ProductoCard({super.key});

  @override
  State<ProductoCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductoCard> {
  List<Producto> producto = [];

  Future<List<Producto>> cogerDatos() async {
    final respuesta = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    var datos = jsonDecode(respuesta.body);

    if (respuesta.statusCode == 200) {
      setState(() {
        for (var item in datos) {
          producto.add(Producto(item["id"], item["title"], item["price"],
              item["description"], item["category"], item["image"]));
        }
      });
    }
    return producto;
  }

  @override
  void initState() {
    super.initState();
    cogerDatos().then((value) => producto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerInicio(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Catalogo completo'),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            actions: [
              GestureDetector(
                child: const Icon(
                  Icons.home,
                  size: 45,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaInicio(),
                      ));
                },
              ),
            ],
          ),
        ),
        body: MostrarCartas(lista: producto));
  }
}
