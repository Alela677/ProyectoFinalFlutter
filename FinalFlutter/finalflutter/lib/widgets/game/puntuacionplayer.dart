import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalflutter/models/resultados.dart';
import 'package:finalflutter/widgets/appBar/appbar.dart';
import 'package:finalflutter/widgets/appBar/appbargame.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';

class PuntosPlayer extends StatefulWidget {
  PuntosPlayer({super.key});

  @override
  State<PuntosPlayer> createState() => _PuntosPlayerState();
}

class _PuntosPlayerState extends State<PuntosPlayer> {
  List<Resultados> documentos = [];

  void getData() async {
    //use a Async-await function to get the data
    await FirebaseFirestore.instance
        .collection("clasificacion")
        .get()
        .then((querySnapshot) {
      // Crear una lista vacía
      setState(() {
        querySnapshot.docs.forEach((result) {
          documentos.add(Resultados(
              result.data()['descuento'].toString(),
              result.data()['nombre'].toString(),
              int.parse(result.data()['puntos'])));
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
      ),
      body: ListView.builder(
        itemCount: documentos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(documentos[index].nombre),
              subtitle: Text(
                  'Tu puntuación ha sido de ${documentos[index].puntos.toString()} puntos \nPremio : ${documentos[index].descuento}'),
            ),
          );
        },
      ),
    );
  }
}
