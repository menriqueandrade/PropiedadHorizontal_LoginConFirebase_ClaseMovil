// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class PeticionesFotos {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearcatalogo(Map<String, dynamic> catalogo, foto) async {
    print(catalogo['foto']);

    var url = '';
    if (foto != null)
      url = await PeticionesFotos.cargarfoto(foto, catalogo['id_user']);
    print(url);
    catalogo['foto'] = url.toString();

    await _db
        .collection('usuarios_existentes')
        .doc(catalogo['id_user'])
        .set(catalogo)
        .catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("usuarios_existentes");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();
    print('url:' + url.toString());
    return url.toString();
  }

  static Future<void> actualizarcatalogo(
      String id, Map<String, dynamic> catalogo) async {
    await _db.collection('catalogoTI').doc(id).update(catalogo).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarcatalogo(String id) async {
    await _db.collection('catalogoTI').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }

  Stream<QuerySnapshot> Consulta(String uid) {
    Query<Map<String, dynamic>> listado = _db
        .collection('usuarios_existentes')
        //.where('estado', isEqualTo: 'A')
        .where('id_user', isEqualTo: uid);

    return listado.snapshots();
  }
}
