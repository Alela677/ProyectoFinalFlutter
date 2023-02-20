import 'dart:math';

// Esta clase contiene la logica que se aplica en el juego

// Metodo que rellena una lista final con el contenido de dos lista diferentes y lo hace de forma aleatoria
List<dynamic> llenarLista(List<dynamic> list1, List<dynamic> lis2) {
  List<dynamic> resultado = [];
  Random random = Random();
  // Indice aleatorio que puede tener un valor de 0 hasta 4
  int index = random.nextInt(4) + 0;

  // Creamos un bucle que se va a ejecutar 5 veces
  for (var i = 0; i < 4; i++) {
    // Añade un elemento a de la primera lista con un indice aleatorio
    resultado.add(list1[index].toString());
    // Actualizamos el indice
    index = random.nextInt(4) + 0;
    // Añade un elemento a de la segunda lista con un indice aleatorio
    resultado.add(lis2[index].toString());
    // Actualizamos el indice
    index = random.nextInt(4) + 0;
  }
  // Devuelve la lista final llena con los diferentes contenidos de las dos listas
  return resultado;
}

// Metodo que calcula el descuento segun los puntos y lointentos delvolvera el descuento obtenido
String descuento(int puntos, int intentos) {
  String descuento = '';
  if (intentos > 0 || intentos <= 3) {
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

// Metodo que actuliza el texto del boton hasta llegar al ultimo resultado enviar resultado
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

// Metodo que incializa las dos lista que contienen las imagenes de juego
void llenarListas(List<dynamic> listaApi, List<dynamic> lista2) {
  listaApi.add(
    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
  );
  listaApi.add(
    'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
  );
  listaApi.add(
    'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg',
  );
  listaApi.add(
    'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
  );
  lista2.add(
    'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MPTQ3?wid=2000&hei=2000&fmt=jpeg&qlt=95&.v=1666124674638',
  );
  lista2.add(
    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/wohf5k8sjdmgogckoczk/air-jordan-1-mid-zapatillas-MsflqZ.png',
  );
  lista2.add(
    'https://www.que.es/wp-content/uploads/2022/10/30-Promo-Code-ES30-Roborock-Robot-aspirador-S7-cepillo-inteligente-para-el-hogar-mopa-de-1.jpg',
  );
  lista2.add(
    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7724efa9-7cdc-4bf7-b1e2-4d657056b277/chicago-bulls-statement-edition-camiseta-jordan-dri-fit-nba-swingman-lQp2Zm.png',
  );
}
