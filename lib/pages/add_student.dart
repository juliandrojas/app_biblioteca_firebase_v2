import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: () {
                print(nombreController.text);
                print(correoController.text);
                print(contrasenaController.text);
              },
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
