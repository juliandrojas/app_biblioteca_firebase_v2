import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//Pages
import 'package:app_biblioteca_firebase_v2/pages/home.dart';
import 'package:app_biblioteca_firebase_v2/pages/add_student.dart';
import 'package:app_biblioteca_firebase_v2/pages/login.dart';
import 'package:app_biblioteca_firebase_v2/pages/formulario_prestamo.dart';

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
      initialRoute: '/home',
      routes: {
        '/login': (context) => const Login(),
        '/addStudent': (context) => const AddStudent(),
        '/home': (context) => const Home(),
        '/formulario_prestamo': (context) => const FormularioPrestamo(),  
      },
    );
  }
}
