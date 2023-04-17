import 'package:flutter/material.dart';
import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
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
