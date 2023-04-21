import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "INGRESO A LA APP",
                style: TextStyle(
                  fontSize: 30,
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
                    bool verificarEstudianteRegistrado =
                        await verificarEstudiante(
                            correoController.text, contrasenaController.text);
                    //Si el estudiante está registrado, procedemos a ir a home
                    if (verificarEstudianteRegistrado) {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: const Text(
                                  'Regístrate para acceder a la app'),
                              actions: [
                                TextButton(
                                  child: const Text("Cerrar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content:
                                const Text('Ingrese el correo y la contraseña'),
                            actions: [
                              TextButton(
                                child: const Text("Cerrar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
                },
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/addStudent');
                  setState(() {});
                },
                child: const Text('Registrarse'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
