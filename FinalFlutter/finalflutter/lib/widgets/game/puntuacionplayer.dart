// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalflutter/models/resultados.dart';
import 'package:finalflutter/widgets/appBar/appbar.dart';
import 'package:finalflutter/widgets/game/utilsgame.dart';
import 'package:flutter/material.dart';

// Widget que muestra las clasificaciones que han jugado al juego y han enviado sus datos a la base de datos
class PuntosPlayer extends StatefulWidget {
  const PuntosPlayer({super.key});

  @override
  State<PuntosPlayer> createState() => _PuntosPlayerState();
}

class _PuntosPlayerState extends State<PuntosPlayer> {
  // Lista donde recoge todo los Objetos de tipo Resultados obtenidos de la base de datos
  List<Resultados> documentos = [];

  // Metodo que realiza una consulta a Firebase a la base de datos
  void getData() async {
    // Consultamos a la base de datos
    await FirebaseFirestore.instance
        .collection("clasificacion")
        .get()
        .then((querySnapshot) {
      // Crear una lista vacía
      setState(() {
        querySnapshot.docs.forEach((result) {
          // Creamos objetos de tipo resultado con cada resultado que nos da la query a la base de datos
          // y añadimos dichos objetos en la lista
          documentos.add(Resultados(
              result.data()['descuento'].toString(),
              result.data()['nombre'].toString(),
              int.parse(result.data()['puntos'])));
        });
      });
    });
  }

  // Metodo que ejecuta siempre lo que contenga al lanzar la vista, lo primero que se ejecuta es lo que contiene este mmetodo
  @override
  void initState() {
    super.initState();
    // Ejecutamos el metodo que llena a lista con los resultados
    getData();
  }

  // Creamos un widget que muestra todo los objetos de la lista de Resultados
  // y los muestra en widget de tipo Card sobre un widget de tipo Scroll
  // que nos permite ajustar la pantalla segun el tamaño que necesitamos
  // y podemos deslizar la vista para ver todo el contenido
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TituloPuntosGame(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: documentos.length,
              itemBuilder: (context, index) {
                return Card(
                  // Widget que muestra los resultados
                  child: ListTile(
                    // Nombre del participante
                    title: Text(
                      documentos[index].nombre,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrange,
                      ),
                    ),
                    // Resultados obtenidos en el juego
                    subtitle: Text(
                      'Tu puntuación ha sido de ${documentos[index].puntos.toString()} puntos \nPremio : ${documentos[index].descuento}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
