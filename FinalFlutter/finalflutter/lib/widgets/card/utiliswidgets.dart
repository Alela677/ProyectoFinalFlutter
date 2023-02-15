// ignore_for_file: must_be_immutable
// x-rapidapi-key=
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EncabezadoCard extends StatelessWidget {
  EncabezadoCard({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  late String titulo;
  late String subtitulo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titulo,
        style: GoogleFonts.aclonica(
          color: Colors.black87,
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        subtitulo,
        style: GoogleFonts.alice(color: Colors.black54, fontSize: 15),
      ),
    );
  }
}

class PieCard extends StatelessWidget {
  PieCard({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  late String titulo;
  late String subtitulo;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        titulo,
        style: GoogleFonts.aclonica(
          color: Colors.black87,
          fontSize: 20,
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            subtitulo,
            style: GoogleFonts.alice(color: Colors.black54, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class ImagenCard extends StatelessWidget {
  ImagenCard({super.key, required this.imagen});

  late String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Image(
        width: 130,
        image: NetworkImage(imagen),
      ),
    );
  }
}

class PrecioCard extends StatelessWidget {
  PrecioCard({super.key, required this.precio});

  late num precio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Price:',
            style: GoogleFonts.aclonica(
              color: Colors.black87,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              Text(
                precio.toString(),
                style: GoogleFonts.aclonica(
                  color: Colors.black87,
                  fontSize: 22,
                ),
              ),
              const Icon(Icons.euro),
            ],
          ),
        ],
      ),
    );
  }
}
