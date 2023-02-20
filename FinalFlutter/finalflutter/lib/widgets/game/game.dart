// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:finalflutter/widgets/appBar/appbargame.dart';
import 'package:finalflutter/widgets/game/utilsgame.dart';
import 'package:flutter/material.dart';
import 'logicagame.dart';

// Clase que contiene el juego
// El juego consite en 6 imagenes 3 del catalogo y 3 imagenes que no estan en el catalogo
// el participante debera acertar cuales son del catalgo de la aplicacion
// se le otrogara un premio segun los ciertos

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GameWidget> {
  List<dynamic> listaApi = [];
  List<dynamic> lista2 = [];
  List<dynamic> listaJuego = [];
  var textControler = TextEditingController();
  int puntos = 0;
  int index = 0;
  int intentos = 0;
  var status0, status1, status2, status3, status4, status5;

  // Metodo que se ejecuta antes de lanzar la aplicacion
  @override
  void initState() {
    // Crea una sola lista a partir de la dos listas que le pasamos
    llenarListas(listaApi, lista2);
    // Rellenamos la lista del juego
    listaJuego = llenarLista(listaApi, lista2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBarGame(),
      ),
      body: ListView(
        children: [
          // Intrucciones del juego
          const TituloGame(),
          // Imagen 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Column(
              children: [
                // Fila 1 que contiene dos contenedores con las imagenes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Al presionar se empieza a aplicar la logica
                    GestureDetector(
                      onTap: () {
                        // Si tiene menos de 3 intentos
                        if (intentos < 3 && puntos <= 3) {
                          // Indice que nos permite identificar la imagen para cambiar el color del borde
                          status0 = 2;
                          setState(() {
                            intentos++; // Se suma un intento
                            // Se calcula la puntuacion
                            calcularPuntucaion(listaJuego[0], intentos);
                          });
                        }
                      },
                      // Contendor que contiene la immagen
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                // Si el status que se le asigna al pulsar sobre a es el mismo que el que comprobamos aqui
                                // se cambiara el color del borde a naranja
                                status0 == 2 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        // Columna que contiene la imagen del contenedor
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Imagen de la lista
                            Image.network(
                              listaJuego[0],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Imagen 2 sigue la misma logica pero con diferente valor de status
                    GestureDetector(
                      onTap: () {
                        if (intentos < 3 && puntos <= 3) {
                          status1 = 1;
                          setState(() {
                            intentos++;
                            calcularPuntucaion(listaJuego[1], intentos);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                status1 == 1 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              listaJuego[1],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Fila 2 que contiene dos contenedores con las imagenes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Imagen 3 sigue la misma logica pero con diferente valor de status
                    GestureDetector(
                      onTap: () {
                        if (intentos < 3 && puntos <= 3) {
                          status2 = 3;
                          setState(() {
                            intentos++;
                            calcularPuntucaion(listaJuego[5], intentos);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                status2 == 3 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              listaJuego[5],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Imagen 4 sigue la misma logica pero con diferente valor de status
                    GestureDetector(
                      onTap: () {
                        if (intentos < 3 && puntos <= 3) {
                          status3 = 4;
                          setState(() {
                            intentos++;
                            calcularPuntucaion(listaJuego[2], intentos);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                status3 == 4 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              listaJuego[2],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Fila 3 que contiene dos contenedores con las imagenes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Imagen 5 sigue la misma logica pero con diferente valor de status
                    GestureDetector(
                      onTap: () {
                        if (intentos < 3 && puntos <= 3) {
                          status4 = 5;
                          setState(() {
                            intentos++;
                            calcularPuntucaion(listaJuego[4], intentos);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                status4 == 5 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              listaJuego[4],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Imagen 6 sigue la misma logica pero con diferente valor de status
                    GestureDetector(
                      onTap: () {
                        if (intentos < 3 && puntos <= 3) {
                          status5 = 6;
                          setState(() {
                            intentos++;
                            calcularPuntucaion(listaJuego[3], intentos);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color:
                                status5 == 6 ? Colors.deepOrange : Colors.black,
                          ),
                        ),
                        margin: const EdgeInsets.all(5),
                        height: 130,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              listaJuego[3],
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Campo de texto que utilizamos para recoger el nombre de participante
                TxtfieldNombre(textControler: textControler),
                // Boton que utilizmaos para mostras lo intentos que tenemos
                // y enviar los resultado a la base de datos
                ButtonEnviar(
                    intentos: intentos,
                    puntos: puntos,
                    nombre: textControler.text),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget que calcula los puntos obtenidos si la imagen que pulsamos
  // contiene una imagen de la lista de imagenes de nuestro catalogo
  // sumara un punto
  calcularPuntucaion(var imagen, int intento) {
    if (listaApi.contains(imagen) && intentos <= 3) {
      puntos++;
    }
  }
}
