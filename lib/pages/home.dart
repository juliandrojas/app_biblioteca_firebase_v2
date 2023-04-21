import 'package:flutter/material.dart';

const Color greenUTS = Color.fromRGBO(203, 212, 36, 1);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Ajusta el tamaño aquí
                ),
                onPressed: () {
                  // Acción al presionar "Prestar Libro"
                  Navigator.pushNamed(context, '/lista_libros_disponibles');
                },
                child: const Text('Prestar Libro'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Ajusta el tamaño aquí
                ),
                onPressed: () {
                  // Acción al presionar "Devolver Libro"
                  Navigator.pushNamed(context, '/lista_libros_prestados');
                },
                child: const Text('Devolver Libro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
