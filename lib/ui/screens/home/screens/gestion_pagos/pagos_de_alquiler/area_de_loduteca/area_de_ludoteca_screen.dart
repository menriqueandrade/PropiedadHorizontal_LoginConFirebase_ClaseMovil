import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/search_coopropietarios.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/area_de_loduteca/lista_area_ludoteca.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/pagos_alquilers_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/salon_de_eventos/lista_alquileres_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/salon_de_eventos/seleccionar_residente_alquilar.dart';

import 'seleccionar_residente_alquilar_ludoteca.dart';

class AreadeLudotecaScreen extends StatefulWidget {
  @override
  State<AreadeLudotecaScreen> createState() => _AreadeLudotecaScreenState();
}

class _AreadeLudotecaScreenState extends State<AreadeLudotecaScreen> {
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
            child: Text("Area de ludoteca", style: TextStyle(color: Colors.lightBlue))),
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
                  child: Icon(Icons.check),
                ),
              ),
            ),
          ),
        ],
      ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => ListaAreaLudotecaScreen());
            },
            child: FaIcon(
              FontAwesomeIcons.list,
              color: Colors.white,
            ),
          ),
          body: Column(
            children: <Widget>[
              Hero(
                tag: 'arealudoteca',
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(
                    'https://www.nevasport.com/fotos/030210/312495-Nuevo-servicio-de-ludoteca-infantil-en-Valdezcaray_tn900x.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Area de Ludoteca"),
                  subtitle: Text(
                      ""),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.to(
                                () => SeleccionarResidenteParaAlquilarLudotecaScreen());
                            informacionUser(context);
                          },
                          child: Text("Alquilar")),
                      ElevatedButton(onPressed: () {
                        Get.back();


                      }, child: Text("Salir"))
                    ],
                  ),
                ],
              )

              // Card(
              //   semanticContainer: true,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   elevation: 5,
              //   margin: EdgeInsets.all(10),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   child:
              // ),
            ],
          )),
    );
  }

  void informacionUser(
    context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Por Favor Leer!"),
          content: Text(
              'Tienes que tener en cuenta que si no estas paz y salvo no saldras en este listado para poder alquilar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Listo',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
