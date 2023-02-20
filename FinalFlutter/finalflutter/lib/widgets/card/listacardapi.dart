import 'package:flutter/material.dart';
import '../../models/producto.dart';
import '../card/utiliscardapi.dart';

// Widget que crea una listview de card con los objetos de una lista que pasamos como parametros
// ignore: must_be_immutable
class MostrarCartas extends StatelessWidget {
  MostrarCartas({super.key, required this.lista});
  late List<Producto> lista;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Card(
              // Decoracion de la card
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 3,
                  color: Colors.orangeAccent,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.all(15),
              child: ClipRRect(
                child: Column(
                  children: <Widget>[
                    // Contenido de la card separados en diferentes widgets
                    // que podemos enccontrar en utilscard
                    // Muestra el contenido de cada atributo del objeto que pasamos como parametro
                    EncabezadoCard(
                        titulo: lista[index].categoria.toUpperCase(),
                        subtitulo: lista[index].titulo),
                    ImagenCard(imagen: lista[index].imagen),
                    PrecioCard(precio: lista[index].precio),
                    PieCard(
                      titulo: 'Description',
                      subtitulo: lista[index].descripcion,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
