import 'package:cloud_firestore/cloud_firestore.dart';

//Instance of FirebaseFirestore
FirebaseFirestore db = FirebaseFirestore.instance;

//Función para traer los datos de los libros (consulta a la BD)
Future<List> obtenerLibros() async {
  //Lista que vamos a regresar
  List libros = [];
  CollectionReference collectionReferenceLibros = db.collection('libros');
  QuerySnapshot queryLibros = await collectionReferenceLibros.get();
  //Iteramos los documentos
  queryLibros.docs.forEach((documento) {
    libros.add(documento.data());
  });
  return libros;
}

//Función para traer los datos de los estudiantes (consulta a la BD)
Future<List> obtenerEstudiantes() async {
  //Lista que vamos a regresar
  List estudiantes = [];
  CollectionReference collectionReferenceEstudiantes =
      db.collection('estudiantes');
  QuerySnapshot queryEstudiantes = await collectionReferenceEstudiantes.get();
  //Iteramos los documentos
  queryEstudiantes.docs.forEach((documento) {
    estudiantes.add(documento.data());
  });
  return estudiantes;
}

//Guardamos en la base de datos los estudiantes que registramos
Future<void> anadirEstudiante(
    String nombre, String correo, String contrasena) async {
  await db
      .collection("estudiantes")
      .add({"nombre": nombre, "correo": correo, "contrasena": contrasena});
}
