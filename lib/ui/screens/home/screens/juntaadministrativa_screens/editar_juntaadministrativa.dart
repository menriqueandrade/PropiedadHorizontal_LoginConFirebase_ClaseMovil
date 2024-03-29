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
  ModificarJuntaAdministrativa(
      {this.posicion, required this.perfil, this.iddoc, this.pos});

  @override
  _ModificarUsuarioState createState() => _ModificarUsuarioState();
}

String? _vista = "Seleccione el tipo ";

class _ModificarUsuarioState extends State<ModificarJuntaAdministrativa> {
  List<String> _tipoUsuario = ["Tesorero", "Administrativo", "Gerencia"];
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlRol = TextEditingController();

  @override
  void initState() {
    controlNombre = TextEditingController(
        text: widget.perfil[widget.pos]['nombrejuntaadmin']);
    controlRol =
        TextEditingController(text: widget.perfil[widget.pos]['roljuntaadmin']);
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
            child: Text("Modificar Junta Admin",
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
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              
              DropdownButtonFormField<String>(
                items: _tipoUsuario.map((String a) {
                  return DropdownMenuItem(value: a, child: Text(a));
                }).toList(),
                onChanged: (val) => {_vista = val},
                hint: Text('Seleccione el tipo'),
              ),
              // TextField(
              //   controller: controlRol,
              //   decoration: InputDecoration(labelText: "Rol"),
              // ),
              ElevatedButton(
                child: Text("Modificar UsuarioJAD"),
                onPressed: () {
                  var juntaadmin = <String, dynamic>{
                    'nombrejuntaadmin': controlNombre.text,
                    'roljuntaadmin': _vista,
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
