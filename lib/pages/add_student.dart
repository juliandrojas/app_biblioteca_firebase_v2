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
        body: Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: 'Ingresa el nombre',
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Registrar"))
      ],
    ));
  }
}
