import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class ListaLibrosPrestados extends StatefulWidget {
  const ListaLibrosPrestados({super.key});

  @override
  State<ListaLibrosPrestados> createState() => _ListaLibrosPrestadosState();
}

class _ListaLibrosPrestadosState extends State<ListaLibrosPrestados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Libros Prestados"),
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
                      onPressed: () {
                        print(snapshot.data?[index]['titulo']);
                      },
                      child: const Text("Devolver")),
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
