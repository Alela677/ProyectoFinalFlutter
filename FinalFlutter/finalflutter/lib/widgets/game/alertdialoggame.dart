import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../inicio/inicioview.dart';

class AlertDialogGame extends StatelessWidget {
  AlertDialogGame(
      {super.key,
      required this.descuento,
      required this.nombre,
      required this.puntos});

  String nombre = '';
  int puntos = 0;
  String descuento = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enviar resultado'),
      content: Text('Ganaste un cupon de $descuento'),
      actions: [
        MaterialButton(
          onPressed: () async {
            await insertarDatos(descuento, puntos, nombre);

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PantallaInicio()),
            );
          },
          child: const Text('Aceptar'),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}

Future<void> insertarDatos(String descuento, int puntos, String nombre) async {
  await FirebaseFirestore.instance.collection('clasificacion').doc(nombre).set({
    'nombre': nombre,
    'puntos': puntos.toString(),
    'descuento': descuento,
  });
}
