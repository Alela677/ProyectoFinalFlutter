import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/producto.dart';
import '../inicio/inicioview.dart';
import '../card/listacardapi.dart';

// Widget que consulta a la api los resultado de la categoria Jewelery  y la muestra en cards
class JeweleryCard extends StatefulWidget {
  const JeweleryCard({super.key});

  @override
  State<JeweleryCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<JeweleryCard> {
  List<Producto> producto = [];
// Consultamos a la api los resultado de la catgoria jewelery y lo almacenamos en una lista que devolvemos llena
  Future<List<Producto>> cogerDatos() async {
    final respuesta = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/jewelery'),
    );

    var datos = jsonDecode(respuesta.body);
    if (respuesta.statusCode == 200) {
      setState(() {
        for (var item in datos) {
          // Creamos objetos productos con los resultado de json que devuelve la api y lo añadimos a la lista
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text('Jewelery'),
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
      body: MostrarCartas(lista: producto),
    );
  }
}
