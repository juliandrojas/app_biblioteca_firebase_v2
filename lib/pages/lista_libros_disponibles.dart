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
        future: obtenerLibrosDisponibles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['titulo']),
                  subtitle: Text(snapshot.data?[index]['autor']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(
                              context, "/formulario_prestamo",
                              arguments: {
                                "poseedor": snapshot.data?[index]['poseedor'],
                                "uid": snapshot.data?[index]['uid'],
                              });
                          setState(() {});
                        },
                        child: const Text("Reservar"),
                      ),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              child: ListTile(
                                title: Text(snapshot.data?[index]['titulo']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data?[index]['categoria']),
                                    Text(snapshot.data?[index]['descripcion']),
                                    Text(snapshot.data?[index]['editorial']),
                                  ],
                                ),
                              ),
                            ),
                          ];
                        },
                        icon: Icon(Icons.info),
                      ),
                    ],
                  ),
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
