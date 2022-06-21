import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Peticiones2 extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  late Rx<dynamic> _user = "".obs;
  String get user => _user.value;
  Stream<QuerySnapshot> readItemsJuntaAdmin() {
    CollectionReference listado = _db.collection('juntaadmin');

    return listado.snapshots();
  }
//   Future<void> crearjuntaadmin(Map<String, dynamic> juntaadmin) async {
//     await _db.collection('juntaadmin').doc().set(juntaadmin).catchError((e) {
//       print(e);
//     });
//     //return true;
//   }

// //'MWPy56bgx9wYBzul88rR'
//   Future<void> actualizarjuntaadmin(
//       String id, Map<String, dynamic> juntaadmin) async {
//     await _db.collection('juntaadmin').doc(id).update(juntaadmin).catchError((e) {
//       print(e);
//     });
//     //return true;
//   }

//   Future<void> eliminarjuntaadmin(String id) async {
//     await _db.collection('juntaadmin').doc(id).delete().catchError((e) {
//       print(e);
//     });
//     //return true;
//   }
}
