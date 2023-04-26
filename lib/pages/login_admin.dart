import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Admin"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "INGRESO DEL ADMINISTRADOR",
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
                    bool esAdministrador = await verificarAdministrador(
                        correoController.text, contrasenaController.text);
                    if (esAdministrador == true) {
                      // Si es administrador, se muestra un mensaje de éxito
                      print("Logueado como administrador :D");
                      Navigator.pushNamed(context, '/home_admin');
                    } else {
                      // Si no es administrador, se muestra un mensaje de error
                      print("No Logueado como administrador :(");
                    }
                  } else {
                    // Si el correo o la contraseña están vacíos, se muestra un mensaje de error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content:
                              const Text('Ingrese tu correo y contraseña'),
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
            ]),
          ),
        ),
      ),
    );
  }
}
