import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  //Controllers
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text(
                        "Añadir estudiante",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                          hintText: 'Ingresa el nombre',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: correoController,
                        decoration: const InputDecoration(
                          hintText: 'Ingresa el correo',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: contrasenaController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Ingresa la contraseña',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          await anadirEstudiante(
                                  nombreController.text,
                                  correoController.text,
                                  contrasenaController.text)
                              .then((_) {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Registrar Estudiante"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
