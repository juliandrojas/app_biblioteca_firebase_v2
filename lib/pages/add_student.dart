import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa el correo',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Ingresa la contraseña',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
