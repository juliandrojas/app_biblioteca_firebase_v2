import 'package:flutter/material.dart';

const Color greenUTS = Color.fromRGBO(203, 212, 36, 1);

class HomeStudent extends StatefulWidget {
  const HomeStudent({super.key});

  @override
  State<HomeStudent> createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Admin"),
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
