import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class FormularioDevolucion extends StatefulWidget {
  const FormularioDevolucion({super.key});

  @override
  State<FormularioDevolucion> createState() => _FormularioDevolucionState();
}

class _FormularioDevolucionState extends State<FormularioDevolucion> {
  //Controllers
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController devolucionController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    //Mapeamos los argumentos que vienen de lista_libros_disponibles.dart
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    //Asignamos los argumentos que vienen de lista_libros_disponibles.dart a la variable nombreController
    devolucionController.text = arguments['poseedor'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de devolución de libros"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                controller: nombreController,
                decoration:
                    const InputDecoration(labelText: "Nombre del estudiante"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await prestarLibro(arguments['uid'], nombreController.text)
                      .then((value) {
                    Navigator.pop(context);
                  });
                  //print(arguments['uid']);
                },
                child: const Text("Devolver"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
