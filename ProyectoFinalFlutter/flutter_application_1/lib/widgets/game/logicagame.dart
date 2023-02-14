import 'dart:math';

List<dynamic> llenarLista(List<dynamic> list1, List<dynamic> lis2) {
  List<dynamic> resultado = [];
  Random random = Random();
  int index = random.nextInt(4) + 0;

  for (var i = 0; i < 4; i++) {
    resultado.add(list1[index].toString());
    index = random.nextInt(3) + 0;

    resultado.add(lis2[index].toString());
    index = random.nextInt(3) + 0;
  }
  return resultado;
}

String descuento(int puntos, int intentos) {
  String descuento = '';
  if (intentos >= 0 || intentos <= 3) {
    if (puntos == 0) {
      descuento = 'Sin descuento';
    } else if (puntos == 1) {
      descuento = '5% descuento';
    } else if (puntos == 2) {
      descuento = '10% descuento';
    } else if (puntos == 3) {
      descuento = '15% descuento';
    } else {
      descuento = descuento;
    }
  } else {
    descuento = descuento;
  }

  return descuento;
}

String infoButton(int intentos) {
  String textoButton = '';

  if (intentos >= 3) {
    textoButton = 'Enviar resultado';
  } else if (intentos == 2) {
    textoButton = 'Queda 1 intentos';
  } else if (intentos == 1) {
    textoButton = 'Queda 2 intentos';
  } else if (intentos <= 0) {
    textoButton = 'Queda 3 intentos';
  }
  return textoButton;
}
