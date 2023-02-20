import 'package:finalflutter/widgets/inicio/inicioview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

// Main que ejecuta la aplicacion
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget que lanza la aplicacion,contiene el widget de lapantalla de incio
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AliExpress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const PantallaInicio(), // Widget de la primera vista de la aplicacion
    );
  }
}
