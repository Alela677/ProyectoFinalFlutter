import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appBar/appbar.dart';

// Widget que contiene la vista principal de la aplicacion
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio>
    with TickerProviderStateMixin {
  // Opciones de las imagenes en movimiento que se muestra en el inicio
  ParticleOptions particleOptions = ParticleOptions(
    image: Image.network(
        'https://pngsnake.com/wp-content/uploads/2023/01/aliexpress-logo-png-2-1.png'),
    baseColor: Colors.blue,
    maxOpacity: 0.8,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado con elq ue navegaremos por la aplicacion
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
      ),
      // Fondo animado con icono de la empresa
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: particleOptions,
        ),
        child: ListView(
          children: [
            // GIF que se muestra en el incio de la aplicacion
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'https://qph.cf2.quoracdn.net/main-qimg-daf6a2ca5978cca4967135f4e3eee126',
                width: 20,
              ),
            ),
            // Texto de presentacion de la vista shop de la aplicacion
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextoInicio(
                icono: Icons.shopping_basket,
                textoIcono: 'SHOP',
                texto:
                    'Explora una amplia gama de lo mejor en AliExpress, ¡y encuentra la que mejor se te ajusta! Además de ofrecerte marcas de gran calidad.',
              ),
            ),
            // Texto explicativo de la vista game  de la aplicacion
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextoInicio(
                  icono: Icons.sports_esports,
                  textoIcono: 'GAME',
                  texto:
                      '¿Estuviste atento a las ofertas de AliExpress?, ponte a prueba con nuestro juego de las ofertas y consigue cupones de descuentos para nuestro productos.'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget quye utilizamos para crear los texto explicativos que se muestra en la vista de inicio
// ignore: must_be_immutable
class TextoInicio extends StatelessWidget {
  TextoInicio(
      {super.key,
      required this.icono,
      required this.textoIcono,
      required this.texto});
  late IconData icono;
  late String textoIcono;
  late String texto;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icono,
            size: 40,
          ),
          Text(textoIcono, style: GoogleFonts.aclonica(fontSize: 20)),
        ],
      ),
      subtitle: Text(texto, style: GoogleFonts.aclonica(fontSize: 20)),
    );
  }
}
