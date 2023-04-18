import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class ListaLibrosDisponibles extends StatefulWidget {
  const ListaLibrosDisponibles({super.key});

  @override
  State<ListaLibrosDisponibles> createState() => _ListaLibrosDisponiblesState();
}

class _ListaLibrosDisponiblesState extends State<ListaLibrosDisponibles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Libros Disponibles"),
      ),
      body: FutureBuilder(
        future: obtenerLibros(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['titulo']),
                  subtitle: Text(snapshot.data?[index]['autor']),
                  trailing: ElevatedButton(
                      onPressed: () async {
                        //print(snapshot.data?[index]['titulo']);
                        await Navigator.pushNamed(
                            context, "/formulario_prestamo",
                            arguments: {
                              "poseedor": snapshot.data?[index]['poseedor'],
                            });
                      },
                      child: const Text("Reservar")),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
