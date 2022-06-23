import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:propiedadh_firebase/models/juntaadministrativa_model.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/coopropietarios_service.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/listado_juntaadministrativa.dart';

import 'residentes_morosos_screen.dart';

class PagoResidenteMoroso extends StatefulWidget {
  final iddoc;
  final pos;
  final posicion;
  //final List<JuntaAdministrativa> juntaadmin;
  final List perfil;
  PagoResidenteMoroso(
      {this.posicion, required this.perfil, this.iddoc, this.pos});

  @override
  _ModificarUsuarioState createState() => _ModificarUsuarioState();
}

class _ModificarUsuarioState extends State<PagoResidenteMoroso> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlVivienda = TextEditingController();
  TextEditingController controlValordeuda = TextEditingController();

  @override
  void initState() {
    controlNombre = TextEditingController(
        text: widget.perfil[widget.pos]['nombrecoopropietarios']);
    controlVivienda =
        TextEditingController(text: widget.perfil[widget.pos]['numeroviviendacoopropietarios']);
    super.initState();
    controlValordeuda =
        TextEditingController(text: widget.perfil[widget.pos]['pagoscoopropietarios']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pago de Residente"),
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
                controller: controlValordeuda,
                decoration: InputDecoration(labelText: "Valor a pagar"),
              ),
              ElevatedButton(
                child: Text("Pagar"),
                onPressed: () {
                  var residentemoros = <String, dynamic>{
                    'nombrejuntaadmin': controlNombre.text,
                    'numeroviviendacoopropietarios': controlVivienda.text,
                    'pagoscoopropietarios': controlValordeuda.text,
                  };
                  ServicesCoopropietarios.actualizarCoopropietarios(widget.perfil[widget.pos].id, residentemoros);
           
                  //Navigator.pushNamed(context);
                  //Aca hay que buscar la manera de que se guarde y lo actualize de una ves sin hacer restart
                  Get.to(ResidentesMorososScreen());
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
