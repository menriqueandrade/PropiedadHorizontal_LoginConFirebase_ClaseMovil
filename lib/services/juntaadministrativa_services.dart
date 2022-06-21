import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ServicesJuntaAdministrativa extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

   Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('juntaadmin');

    return listado.snapshots();
  }

  static Future<void> crearJuntaAdmin(Map<String, dynamic> juntaadmin) async {
    await _db.collection('juntaadmin').doc().set(juntaadmin).catchError((e) {
      print(e);
    });
    //return true;
  }

//'MWPy56bgx9wYBzul88rR'
  static Future<void> actualizarJuntaAdmin(
      String id, Map<String, dynamic> juntaadmin) async {
    await _db.collection('juntaadmin').doc(id).update(juntaadmin).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarJuntaAdmin(String id) async {
    await _db.collection('juntaadmin').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
