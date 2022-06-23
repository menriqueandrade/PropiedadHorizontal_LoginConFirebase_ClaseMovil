import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/login_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/residentes_morosos_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/habitantes_paz_salvo_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pago_administracion.screen.dart';

import 'testconsulta.dart';

void main() => runApp(GestionPagosScreen());

class GestionPagosScreen extends StatefulWidget {
  @override
  State<GestionPagosScreen> createState() => _GestionPagosScreenState();
}

class _GestionPagosScreenState extends State<GestionPagosScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gestion de Pagos'),
        ),
        body: Center(
          child: Wrap(
            children: <Widget>[
              // ignore: prefer_const_constructors
              Card(
                // ignore: prefer_const_constructors
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                     Get.to(() => PagoAdministracionScreen());
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(child: Text('Pago de administracion')),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                  //     Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //     builder: (BuildContext context) => testsearch();
             //    Get.to(() => testsearch());
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(child: Text('Pagos de Alquiler')),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                  Get.to(() => ResidentesPazySalvo());
               
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(child: Text('Habitantes paz y salvo')),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                       Get.to(() => ResidentesMorososScreen());
             
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(child: Text('Habitantes Morosos')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
