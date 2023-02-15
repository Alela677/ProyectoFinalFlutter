import 'dart:collection';
import 'dart:math';
import 'package:finalflutter/widgets/appBar/appbargame.dart';
import 'package:finalflutter/widgets/game/puntuacionplayer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../appBar/appbar.dart';
import 'alertdialoggame.dart';
import 'logicagame.dart';

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

  @override
  void initState() {
    listaApi.add('https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg');
    listaApi.add(
        'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg');
    listaApi.add('https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg');
    listaApi.add('https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg');
    lista2.add(
        'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPTQ3?wid=2000&hei=2000&fmt=jpeg&qlt=95&.v=1666124674638');
    lista2.add(
        'https://media.lolarey.es/156797-new_large_default/mochila-vans-old-skool-drop-black-white.jpg');
    lista2.add(
        'https://www.que.es/wp-content/uploads/2022/10/30-Promo-Code-ES30-Roborock-Robot-aspirador-S7-cepillo-inteligente-para-el-hogar-mopa-de-1.jpg');
    lista2.add(
        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7724efa9-7cdc-4bf7-b1e2-4d657056b277/chicago-bulls-statement-edition-camiseta-jordan-dri-fit-nba-swingman-lQp2Zm.png');

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: TextField(
              controller: textControler,
              decoration: const InputDecoration(
                hintText: "Escribe tu nombre",
                icon: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[0], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[0],
                          width: 90,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[3], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[3],
                          width: 90,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[5], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[5],
                          width: 90,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[1], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[1],
                          width: 90,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[2], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[2],
                          width: 90,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        calcularPuntucaion(listaJuego[4], intentos);
                        if (intentos < 4 && puntos <= 3) {
                          setState(() {
                            intentos++;
                          });

                          if (infoButton(intentos) == 'Enviar resultado') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialogGame(
                                descuento: descuento(puntos, intentos),
                                nombre: textControler.text,
                                puntos: puntos,
                              ),
                            );
                          }
                        }
                      },
                      child: SizedBox(
                        child: Image.network(
                          listaJuego[4],
                          width: 90,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: MaterialButton(
                    minWidth: 900,
                    color: Colors.deepOrange,
                    onPressed: () {
                      if (infoButton(intentos) == 'Enviar resultado') {
                        insertarDatos(descuento(puntos, intentos), puntos,
                            textControler.text);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialogGame(
                            descuento: descuento(puntos, intentos),
                            nombre: textControler.text,
                            puntos: puntos,
                          ),
                        );
                      }
                    },
                    child: Text(infoButton(intentos)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  calcularPuntucaion(var imagen, int intento) {
    if (listaApi.contains(imagen) && intentos < 3) {
      puntos++;
    }
  }
}
