import 'package:cloud_firestore/cloud_firestore.dart';

//Instance of FirebaseFirestore
FirebaseFirestore db = FirebaseFirestore.instance;

//Función para traer los datos (consulta a la BD)
Future<List> getBooks() async {
  List libros = [];
  //Referencia a la colección (La colección se llama libros)
  CollectionReference collectionReferenceLibros = db.collection('libros');
  //Nos traemos la información de la colección
  QuerySnapshot queryLibros = await collectionReferenceLibros.get();
  //Recorremos la lista de documentos
  queryLibros.docs.forEach((documento) {
    //Agregamos los documentos a la lista
    libros.add(documento.data());
  });
  return libros;
}
