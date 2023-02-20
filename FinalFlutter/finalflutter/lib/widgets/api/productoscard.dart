import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/producto.dart';
import '../card/listacardapi.dart';
import '../drawer/drawer.dart';
import '../inicio/inicioview.dart';

// Widget que muestra todo los producto obtenidos de la api en cards
class ProductoCard extends StatefulWidget {
  const ProductoCard({super.key});

  @override
  State<ProductoCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductoCard> {
  List<Producto> producto = [];

// Consulta todo los productos de la api
  Future<List<Producto>> cogerDatos() async {
    final respuesta = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    var datos = jsonDecode(respuesta.body);

    if (respuesta.statusCode == 200) {
      setState(() {
        // Creamos objetos productos con los resultado de json que devuelve la api y lo añadimos a la lista
        for (var item in datos) {
          producto.add(Producto(item["id"], item["title"], item["price"],
              item["description"], item["category"], item["image"]));
        }
      });
    }
    return producto;
  }

// Metodo que se ejecuta al incializar la vista
  @override
  void initState() {
    super.initState();
    // Ejecuta la consulta y almacena los datos en la lista de productos
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
              // Icono home que utilizamos para volver a la pantalla de incio desde la vista shop
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
        // Mostramos el contenido de la lista en cards
        body: MostrarCartas(lista: producto));
  }
}
