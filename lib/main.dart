import 'package:app_biblioteca_firebase_v2/pages/home_student.dart';
import 'package:app_biblioteca_firebase_v2/pages/login_student.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//Pages
import 'package:app_biblioteca_firebase_v2/pages/role_separator.dart';
import 'package:app_biblioteca_firebase_v2/pages/login_admin.dart';
import 'package:app_biblioteca_firebase_v2/pages/add_student.dart';
import 'package:app_biblioteca_firebase_v2/pages/home_admin.dart';
import 'package:app_biblioteca_firebase_v2/pages/lista_libros_disponibles.dart';
import 'package:app_biblioteca_firebase_v2/pages/formulario_prestamo.dart';
import 'package:app_biblioteca_firebase_v2/pages/lista_libros_prestados.dart';
import 'package:app_biblioteca_firebase_v2/pages/formulario_devolucion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/roleSeparator',
      routes: {
        '/roleSeparator': (context) => const RoleSeparator(),
        //Parte Administrador
        '/login_admin': (context) => const LoginAdmin(),
        '/home_admin': (context) => const HomeAdmin(),
        //Parte Estudiantes
        '/login_student': (context) => const LoginStudent(),
        '/add_student': (context) => const AddStudent(),
        '/home_student': (context) => const HomeStudent(),
        '/lista_libros_disponibles': (context) =>
            const ListaLibrosDisponibles(),
        '/formulario_prestamo': (context) => const FormularioPrestamo(),
        '/lista_libros_prestados': (context) => const ListaLibrosPrestados(),
        '/formulario_devolucion': (context) => const FormularioDevolucion(),
      },
    );
  }
}
