

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/login_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/habitantes_morosos/residentes_morosos_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/habitantes-paz-y-salvo/habitantes_paz_salvo_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pago_administracion/pago_administracion.screen.dart';

import 'pagos_de_alquiler/pagos_alquilers_screen.dart';
import 'testconsulta.dart';

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
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Row(
            children: [
              Container(
                height: 60,
                width: 50,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
          title: Center(
              child: Text("Gestion de Pagos",
                  style: TextStyle(color: Colors.lightBlue))),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(Icons.payments),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Wrap(
            children: <Widget>[
              // ignore: prefer_const_constructors
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Get.to(() => PagoAdministracionScreen());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 172,
                      child: Column(children: [
                        Hero(
                          tag: '1',
                          child: Image.network(
                            'https://static.wixstatic.com/media/c3c990_3e17f317dd0449bea311d06775bdf095~mv2.jpg/v1/fill/w_432,h_432,al_c,q_90/c3c990_3e17f317dd0449bea311d06775bdf095~mv2.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Pago Administracion",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Get.to(() => PagosDeAlquiler());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 172,
                      child: Column(children: [
                        Hero(
                          tag: '2',
                          child: Image.network(
                            'https://i.imgur.com/50rJEz8.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pagos de Alquiler",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),

              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Get.to(() => ResidentesPazySalvo());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 172,
                      child: Column(children: [
                        Hero(
                          tag: '4',
                          child: Image.network(
                            'https://www.compas.com.co/portals/0/icon-pagos.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Habitantes paz y salvo",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Get.to(() => ResidentesMorososScreen());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 172,
                      child: Column(children: [
                        Hero(
                          tag: '5',
                          child: Image.network(
                            'https://static.vecteezy.com/system/resources/thumbnails/001/848/160/small/bankruptcy-sad-businessman-with-stack-of-papers-debts-free-vector.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Habitantes Morosos",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
