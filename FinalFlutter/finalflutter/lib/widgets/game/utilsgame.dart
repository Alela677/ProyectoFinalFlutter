// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'alertdialoggame.dart';
import 'logicagame.dart';

// Aqui se encuentran algunos de los widget que se utilizan en el juego

// Widget que contiene el boton para enviar los resultados del juego a la base de datos
class ButtonEnviar extends StatelessWidget {
  ButtonEnviar(
      {super.key,
      required this.intentos,
      required this.puntos,
      required this.nombre});

  int intentos;
  int puntos;
  String nombre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: MaterialButton(
        color: Colors.deepOrange,
        minWidth: 900,
        onPressed: () {
          // Logicadel boton si el boton tiene como texto 'Enviar resultado' alpulsarlo se aplicara la logica
          if (infoButton(intentos) == 'Enviar resultado') {
            // Mostrara un  widget Alertdialog con infirmacion del juego y dos botones aceptar y cancelar
            // Contien 3 parametros el descuento obtenido, el nombre y lospuntos conseguidos
            showDialog(
              context: context,
              builder: (context) => AlertDialogGame(
                descuento: descuento(puntos, intentos),
                nombre: nombre,
                puntos: puntos,
              ),
            );
          }
        },
        // Texto que se modifica segunn los intentos que tengas en el juego
        child: Text(infoButton(intentos)),
      ),
    );
  }
}

// Widget que recoge el nombre del participante
class TxtfieldNombre extends StatelessWidget {
  TxtfieldNombre({super.key, required this.textControler});

  // Controlador del campo txtfield que usamos para recoger el texto introducido
  var textControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: textControler,
        decoration: const InputDecoration(
          hintText: "Escribe tu nombre",
          icon: Icon(Icons.person),
        ),
      ),
    );
  }
}

// Widget titulo game queutilizamos para mostras las intrucciones del juego
class TituloGame extends StatelessWidget {
  const TituloGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: ListTile(
        title: Text(
          '!Escoge 3 productos¡',
          style: TextStyle(fontSize: 25),
        ),
        subtitle: Text(
            'Se sumara un 5% de descuento si aciertas cuales son los productos de nuestro catálogo'),
      ),
    );
  }
}

// Widget que utilizamos como titulos de la vista top donde se muestran la clasificacion de los participantes
class TituloPuntosGame extends StatelessWidget {
  const TituloPuntosGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: ListTile(
        title: Text(
          'Participantes',
          style: TextStyle(fontSize: 30),
        ),
        subtitle: Text('Aqui puede ver las puntuaciones de los participantes'),
      ),
    );
  }
}
