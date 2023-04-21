import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class ListaLibrosPrestados extends StatefulWidget {
  const ListaLibrosPrestados({super.key});

  @override
  State<ListaLibrosPrestados> createState() => _ListaLibrosPrestadosState();
}

class _ListaLibrosPrestadosState extends State<ListaLibrosPrestados> {
  //Controllers
  TextEditingController nombreController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    //final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Libros Prestados"),
      ),
      body: FutureBuilder(
        future: obtenerLibrosaPrestados(),
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
                        devolverLibro(snapshot.data?[index]['uid']).then((_) {
                          Navigator.pop(context);
                        });
                        //devolverLibro(arguments['uid']);
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
