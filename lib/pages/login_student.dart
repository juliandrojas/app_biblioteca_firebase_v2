import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoginStudent extends StatefulWidget {
  const LoginStudent({super.key});

  @override
  State<LoginStudent> createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Student"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "INGRESO DEL ESTUDIANTE",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'Digita tu correo electrónico',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: contrasenaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Digita tu contraseña',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (correoController.text.isNotEmpty &&
                      contrasenaController.text.isNotEmpty) {
                    bool esEstudiante = await verificarEstudiante(
                        correoController.text, contrasenaController.text);
                    if (esEstudiante == true) {
                      // Si es administrador, se muestra un mensaje de éxito
                      print("Logueado como estudiante :D");
                      Navigator.pushNamed(context, '/home_student');
                    } else {
                      // Si no es administrador, se muestra un mensaje de error
                      print("No Logueado como estudiante :(");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content:
                                const Text('Regístrate para acceder a la app'),
                            actions: [
                              TextButton(
                                child: const Text("Cerrar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    // Si el correo o la contraseña están vacíos, se muestra un mensaje de error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text('Ingrese tu correo y contraseña'),
                          actions: [
                            TextButton(
                              child: const Text("Cerrar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Prestar Libro"
                  Navigator.pushNamed(context, '/add_student');
                },
                child: const Text('Registrarse'),
              ),
              /*const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Prestar Libro"
                  Navigator.pushNamed(context, '/add_student');
                },
                child: const Text('Salir'),
              ),*/
            ]),
          ),
        ),
      ),
    );
  }
}
