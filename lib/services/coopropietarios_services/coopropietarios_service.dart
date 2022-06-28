import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ServicesCoopropietarios extends GetxController {

  late Rx<dynamic> _nombrelog = "".obs;
   String get nombre_user => _nombrelog.value;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

   Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('coopropietarios');

    return listado.snapshots();
  }

  static Future<void> crearCoopropietarios(Map<String, dynamic> coopropietarios) async {
    await _db.collection('coopropietarios').doc().set(coopropietarios).catchError((e) {
      print(e);
    });
    //return true;
  }

//'MWPy56bgx9wYBzul88rR'
  static Future<void> actualizarCoopropietarios(
      String id, Map<String, dynamic> coopropietarios) async {
    await _db.collection('coopropietarios').doc(id).update(coopropietarios).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarCoopropietarios(String id) async {
    await _db.collection('coopropietarios').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
