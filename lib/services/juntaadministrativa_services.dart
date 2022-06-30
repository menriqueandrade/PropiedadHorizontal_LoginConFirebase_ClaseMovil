import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class ServicesJuntaAdministrativa extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('juntaadmin');

    return listado.snapshots();
  }

  static Future<void> crearJuntaAdmin(
      Map<String, dynamic> juntaadmin, foto) async {
    /* */
    var url = '';
    if (foto != null) {
      url = await ServicesJuntaAdministrativa.cargarfoto(
          foto, juntaadmin['cedulajuntaadmin']);
    }
    print(url);
    juntaadmin['foto'] = url.toString();

    /*Crea documento con su id por usuario  */
    await _db
        .collection('juntaadmin')
        .doc(juntaadmin['cedulajuntaadmin'])
        .set(juntaadmin)
        .catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("juntaadmingaleria");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();
    print('url:' + url.toString());
    return url.toString();
  }

//'MWPy56bgx9wYBzul88rR'
  static Future<void> actualizarJuntaAdmin(
      String id, Map<String, dynamic> juntaadmin) async {
    await _db
        .collection('juntaadmin')
        .doc(id)
        .update(juntaadmin)
        .catchError((e) {
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
