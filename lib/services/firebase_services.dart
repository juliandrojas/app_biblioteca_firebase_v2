import 'package:cloud_firestore/cloud_firestore.dart';

//Instance of FirebaseFirestore
FirebaseFirestore db = FirebaseFirestore.instance;
//Parte Administrador
// Define una función que verifica si el correo termina en correo.uts.edu.co
Future<bool> verificarAdministrador(String correo, String contrasena) async {
  // Verifica si el correo termina con "@correo.uts.edu.co"
  if (correo.endsWith("@correo.uts.edu.co")) {
    // Realiza una consulta a la base de datos
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('correo', isEqualTo: correo)
        .where('contrasena', isEqualTo: contrasena)
        .get();

    // Verifica si la consulta devuelve algún resultado
    if (snapshot.docs.length == 1) {
      return true; // Los valores del formulario están en la base de datos
    } else {
      return false; // Los valores del formulario no están en la base de datos
    }
  } else {
    return false; // El correo no coincide con el formato esperado
  }
}
//Guardamos en la base de datos los estudiantes que registramos
Future<void> anadirLibro(
    String titulo, String autor, String editorial, String categoria, String descripcion, String poseedor) async {
  await db
      .collection("libros")
      .add({
        "titulo": titulo, 
        "autor": autor, 
        "editorial": editorial,
        "categoria": categoria, 
        "descripcion": descripcion,
        "poseedor": ""});
}
//Parte estudiantes
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

//Función para traer los datos de los libros prestados (consulta a la BD)
Future<List> obtenerLibrosDisponibles() async {
  //Lista que vamos a regresar
  List libros = [];
  QuerySnapshot querySnapshot =
      await db.collection('libros').where('poseedor', isEqualTo: '').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final libro = {
      "autor": data['autor'],
      "categoria": data['categoria'],
      "descripcion": data['descripcion'],
      "editorial": data['editorial'],
      "poseedor": data['poseedor'],
      "titulo": data['titulo'],
      "uid": doc.id,
    };
    libros.add(libro);
  }

  return libros;
}

//Función para traer los datos de los libros prestados (consulta a la BD)
Future<List> obtenerLibrosaPrestados() async {
  //Lista que vamos a regresar
  List libros = [];
  QuerySnapshot querySnapshot =
      await db.collection('libros').where('poseedor', isNotEqualTo: '').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final libro = {
      "autor": data['autor'],
      "categoria": data['categoria'],
      "descripcion": data['descripcion'],
      "editorial": data['editorial'],
      "poseedor": data['poseedor'],
      "titulo": data['titulo'],
      "uid": doc.id,
    };
    libros.add(libro);
  }

  return libros;
}

//Actualizar poseedor del libro a prestar
Future<void> prestarLibro(String uid, String newPoseedor) async {
  await db.collection("libros").doc(uid).update({"poseedor": newPoseedor});
}

Future<void> devolverLibro(String uid) async {
  await db.collection("libros").doc(uid).update({"poseedor": ""});
}
