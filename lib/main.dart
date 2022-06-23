import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/app.dart';
import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';
import 'package:propiedadh_firebase/domain/controller/conectividad.dart';

import 'services/coopropietarios_services/search_coopropietarios.dart';
import 'services/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauth());
  Get.put(Peticiones2());
  Get.put(PeticionesCoop());

  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });

  runApp(MyApp());
}
  