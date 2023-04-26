import 'package:app_biblioteca_firebase_v2/services/firebase_services.dart';
import 'package:flutter/material.dart';

const Color greenUTS = Color.fromRGBO(203, 212, 36, 1);

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  //Controllers
  TextEditingController tituloController = TextEditingController(text: "");
  TextEditingController autorController = TextEditingController(text: "");
  TextEditingController editorialController = TextEditingController(text: "");
  TextEditingController categoriaController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController poseedorController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Admin"),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          "Registrar libro",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: tituloController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa el título del libro',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: autorController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa el autor del libro',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: editorialController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa la editorial del libro',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: categoriaController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa la categoría del libro',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: descripcionController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa la descripción del libro',
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            await anadirLibro(
                                    tituloController.text,
                                    autorController.text,
                                    editorialController.text,
                                    categoriaController.text,
                                    descripcionController.text,
                                    poseedorController.text)
                                .then((_) {
                              AlertDialog(
                                title: const Text("Mensaje"),
                                content: const Text(
                                    "El libro ha sido registrado exitosamente."),
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
                          },
                          child: const Text("Registrar ejemplar"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cerrar sesión"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
