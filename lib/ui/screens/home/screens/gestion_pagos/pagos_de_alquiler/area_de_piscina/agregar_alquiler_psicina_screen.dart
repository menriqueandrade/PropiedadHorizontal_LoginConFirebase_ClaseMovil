import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:propiedadh_firebase/models/juntaadministrativa_model.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/coopropietarios_service.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/ui/test.dart';

import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/widgets/invoice_table.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/area_de_piscina/area_de_piscina_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/listado_juntaadministrativa.dart';

class AgregarAlquilerPiscinaUser extends StatefulWidget {
  final iddoc;
  final pos;
  final posicion;
  //final List<JuntaAdministrativa> juntaadmin;
  final List perfil;
  AgregarAlquilerPiscinaUser(
      {this.posicion, required this.perfil, this.iddoc, this.pos});

  @override
  _ModificarUsuarioState createState() => _ModificarUsuarioState();
}

class _ModificarUsuarioState extends State<AgregarAlquilerPiscinaUser> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlVivienda = TextEditingController();
  TextEditingController controlPagoAlquiler = TextEditingController();
  TextEditingController controlNombreAlquiler = TextEditingController();

  @override
  void initState() {
    controlNombre = TextEditingController(
        text: widget.perfil[widget.pos]['nombrecoopropietarios']);
    controlVivienda = TextEditingController(
        text: widget.perfil[widget.pos]['numeroviviendacoopropietarios']);
    super.initState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
            child: Text("Pago de Alquiler", style: TextStyle(color: Colors.lightBlue))),
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                enabled: false,
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre del residente"),
              ),
              TextField(
                enabled: false,
                controller: controlVivienda,
                decoration: InputDecoration(labelText: "# Vivienda"),
              ),
              TextField(
                controller: controlNombreAlquiler,
                decoration: InputDecoration(labelText: "Servicio a alquilar"),
              ),
              TextField(
                controller: controlPagoAlquiler,
                decoration: InputDecoration(labelText: "Valor a pagar"),
              ),
              ElevatedButton(
                child: Text("Pagar"),
                
                onPressed: () {
                  var residentemoros = <String, dynamic>{
                    'nombreservicioalquiler': controlNombreAlquiler.text,
                    'pagosalquilercoop': controlPagoAlquiler.text,
                  };

                  ServicesCoopropietarios.actualizarCoopropietarios(
                      widget.perfil[widget.pos].id, residentemoros);

                  //Navigator.pushNamed(context);
                  //Aca hay que buscar la manera de que se guarde y lo actualize de una ves sin hacer restart
                  Get.to(AreadePiscinaScreen());
                },
              ),
              ElevatedButton(
                child: Text("Atras"),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
