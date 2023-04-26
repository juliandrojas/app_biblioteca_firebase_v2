import 'package:flutter/material.dart';

const Color greenUTS = Color.fromRGBO(203, 212, 36, 1);

class RoleSeparator extends StatefulWidget {
  const RoleSeparator({super.key});

  @override
  State<RoleSeparator> createState() => _RoleSeparatorState();
}

class _RoleSeparatorState extends State<RoleSeparator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Role Separator"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logoApp.png'),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Ajusta el tamaño aquí
                ),
                onPressed: () {
                  // Acción al presionar "Ingreso Administrador"
                  Navigator.pushNamed(context, '/login_admin');
                },
                child: const Text('Ingreso Administrador'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Ajusta el tamaño aquí
                ),
                onPressed: () {
                  // Acción al presionar "Ingreso Estudianes"
                  Navigator.pushNamed(context, '/login_student');
                },
                child: const Text('Ingreso Estudiantes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
