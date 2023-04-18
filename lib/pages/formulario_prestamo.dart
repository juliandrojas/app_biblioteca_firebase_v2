import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class FormularioPrestamo extends StatefulWidget {
  const FormularioPrestamo({super.key});

  @override
  State<FormularioPrestamo> createState() => _FormularioPrestamoState();
}

class _FormularioPrestamoState extends State<FormularioPrestamo> {
  //Controllers
  TextEditingController nombreController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de préstamo de libros"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: "Nombre del estudiante"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Prestar"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
