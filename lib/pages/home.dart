import 'package:app_biblioteca_firebase_v2/pages/lista_libros_disponibles.dart';
import 'package:app_biblioteca_firebase_v2/pages/devolver_libro.dart';
import 'package:flutter/material.dart';

const Color greenUTS = Color.fromRGBO(203, 212, 36, 1);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    const ListaLibrosDisponibles(),
    const DevolverLibro(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //Si tenemos dos elementos
        //body: _paginaActual == 0 ? const PrestarLibro() : const DevolverLibro(),
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_upward_outlined),
                label: 'Prestar libro'),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_downward), label: 'Devolver libro'),
          ],
        ),
      ),
    );
  }
}
