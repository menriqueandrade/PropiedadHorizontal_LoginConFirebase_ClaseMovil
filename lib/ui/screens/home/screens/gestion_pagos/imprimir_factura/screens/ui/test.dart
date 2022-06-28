// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/coopropietarios_service.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/search_coopropietarios.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/services/search.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/copropietarios_screens/agregar_coopropietarios.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/components/image_builder.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/components/spacer.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/widgets/invoice_table.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/widgets/save_btn.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/agregar_juntaadministrativa.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/editar_juntaadministrativa.dart';

class Testx extends StatefulWidget {
  @override
  _TestxState createState() =>
      _TestxState();
}

class _TestxState extends State<Testx> {
  PeticionesCoop variablescoop = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: obtenerInformacion(
          context, variablescoop.ConsultaFacturaUsuario()),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Get.to(() => AgregarCoopropietarios());

            //obtenerInformacion(context, variablesjuntaadmin.readItemsJuntaAdmin());
          });
        },
        tooltip: 'Crear usuario juntaAdmin',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@override
Widget obtenerInformacion(BuildContext context, Stream<QuerySnapshot> ct) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaCoopropietarios(
                  coopropietarios: snapshot.data!.docs)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaCoopropietarios extends StatelessWidget {
  final List coopropietarios;

  VistaCoopropietarios({required this.coopropietarios});

  @override
  Widget build(BuildContext context) {
    ServicesCoopropietarios controls = Get.find();
    return ListView.builder(
        itemCount:
            1,
        itemBuilder: (context, posicion) {
          print(coopropietarios[posicion].id);
          // print(juntaadministrativa[posicion].nombre);
          return Column(
              children: <Widget> [
                Text("Pago de Factura",
                    style: TextStyle(
                        fontSize: 25.00, fontWeight: FontWeight.bold)),
                HeightSpacer(myHeight: 10.00),
                Divider(),
                Align(
                  alignment: Alignment.topRight,
                  child: ImageBuilder(
                    imagePath: "assets/image.png",
                    imgWidth: 250,
                    imgheight: 250,
                  ),
                ),
                InvoiceBuilder(
                          perfil: coopropietarios,
                          pos: posicion,
                          iddoc: coopropietarios[posicion].id),
                HeightSpacer(myHeight: 15.00),
                Text(
                 "TS",
                  style: TextStyle(color: Colors.grey, fontSize: 15.00),
                ),
                HeightSpacer(myHeight: 5.00),
                Text(
                  "Contact the branch for any clarifications.",
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.grey, fontSize: 15.00),
                ),
                HeightSpacer(myHeight: 15.00),
                SaveBtnBuilder(),
              ],
            );

        });
  }

  void confirmaeliminarUsuario(context, ideliminar) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Realmente Desea Eliminar?'),
          actions: <Widget>[
            ElevatedButton(
              child: Icon(Icons.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Icon(Icons.check_circle),
              onPressed: () {
                ServicesJuntaAdministrativa.eliminarJuntaAdmin(ideliminar);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
