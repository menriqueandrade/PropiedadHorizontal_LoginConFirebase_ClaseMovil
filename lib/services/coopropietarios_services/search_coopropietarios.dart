import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PeticionesCoop extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  late Rx<dynamic> _user = "".obs;
  String get user => _user.value;
  Stream<QuerySnapshot> readItemsCoopropietarios() {
    CollectionReference listado = _db.collection('coopropietarios');

    return listado.snapshots();
  }
  static Future<void> crearCoopropietarios(Map<String, dynamic> coopropietarios) async {
     await _db.collection('coopropietarios').doc().set(coopropietarios).catchError((e) {
       print(e);
     });
     
   }

 
   Future<void> actualizarCoopropietarios(
       String id, Map<String, dynamic> coopropietarios) async {
     await _db.collection('coopropietarios').doc(id).update(coopropietarios).catchError((e) {
       print(e);
     });
   
   }

   Future<void> eliminarCoopropietarios(String id) async {
     await _db.collection('coopropietarios').doc(id).delete().catchError((e) {
       print(e);
     });
   
   }
   Stream<QuerySnapshot> ConsultarHabitantesPazySalvo() {
    CollectionReference listado = _db.collection('coopropietarios');

    final listpagados = listado.where("pagoscoopropietarios", whereIn: ["50.000"]);

    return listpagados.snapshots();
  }

  Stream<QuerySnapshot> ConsultarHabitantesMorosos() {
    CollectionReference listado = _db.collection('coopropietarios');

    final listmorosos = listado.where("pagoscoopropietarios", whereIn: ["Pendiente por pago"]);

    return listmorosos.snapshots();
  }
}
