import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:propiedadh_firebase/models/juntaadministrativa_model.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/listado_juntaadministrativa.dart';

class ModificarJuntaAdministrativa extends StatefulWidget {
  final iddoc;
  final pos;
  final posicion;
  //final List<JuntaAdministrativa> juntaadmin;
  final List perfil;
  ModificarJuntaAdministrativa({ this.posicion, required this.perfil, this.iddoc, this.pos});

  @override
  _ModificarUsuarioState createState() => _ModificarUsuarioState();
}

class _ModificarUsuarioState extends State<ModificarJuntaAdministrativa> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlRol = TextEditingController();

  @override
  void initState() {
    controlNombre =
        TextEditingController(text: widget.perfil[widget.pos]['nombrejuntaadmin']);
    controlRol =
        TextEditingController(text: widget.perfil[widget.pos]['roljuntaadmin']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Usuario"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: controlRol,
                decoration: InputDecoration(labelText: "Rol"),
              ),
              ElevatedButton(
                child: Text("Modificar UsuarioJAD"),
                onPressed: () {
                  var juntaadmin = <String, dynamic>{
                    'nombrejuntaadmin': controlNombre.text,
                    'roljuntaadmin': controlRol.text,
                  };
                  ServicesJuntaAdministrativa.actualizarJuntaAdmin(
                      widget.perfil[widget.pos].id, juntaadmin);
                  //Navigator.pushNamed(context);
                  //Aca hay que buscar la manera de que se guarde y lo actualize de una ves sin hacer restart
                  Get.to(Listado_JuntaAdministrativa());
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
