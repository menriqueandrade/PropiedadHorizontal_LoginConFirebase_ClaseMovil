// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, unused_field, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unused_label

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';



class AgregarJuntaAdministrativa extends StatefulWidget {
  @override
  State<AgregarJuntaAdministrativa> createState() =>
      _AgregarJuntaAdministrativaState();
}

class _AgregarJuntaAdministrativaState
    extends State<AgregarJuntaAdministrativa> {
  TextEditingController _controladorNombre = TextEditingController();
  TextEditingController _controladorRol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Stack(
              children: [
                Image.asset('assets/fondo.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity),
                Wrap(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                          height: 280,
                          child: Image.asset(
                            'assets/juntaadmin.png',
                            fit: BoxFit.fill,
                            width: 500,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _TextFieldNombre(
                              controladorNombre: _controladorNombre)),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _TextFieldRol(controladorRol: _controladorRol)),
                      _ButtonEntrar(
                        controladorNombre: _controladorNombre,
                        controladorRol: _controladorRol,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _TextFieldNombre extends StatelessWidget {
  const _TextFieldNombre({
    Key? key,
    required TextEditingController controladorNombre,
  })  : _controladorNombre = controladorNombre,
        super(key: key);

  final TextEditingController _controladorNombre;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _controladorNombre,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Nombre',
            hintText: "Raul",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorNombre.clear();
              },
            ),
          ),
        );
      },
    );
  }
}

class _TextFieldRol extends StatelessWidget {
  const _TextFieldRol({
    Key? key,
    required TextEditingController controladorRol,
  })  : _controladorRol = controladorRol,
        super(key: key);

  final TextEditingController _controladorRol;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _controladorRol,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Rol',
            hintText: "ejemplo@gmail.com",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorRol.clear();
              },
            ),
          ),
        );
      },
    );
  }
}

class _ButtonEntrar extends StatelessWidget {
  bool bandera = false;

  _ButtonEntrar({
    Key? key,
    required TextEditingController controladorNombre,
    required TextEditingController controladorRol,
  })  : _controladorNombre = controladorNombre,
        _controladorRol = controladorRol,
        super(key: key);

  final TextEditingController _controladorNombre;
  final TextEditingController _controladorRol;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                var juntaadmin = <String, dynamic>{
                    'nombrejuntaadmin': _controladorNombre.text,
                    'roljuntaadmin': _controladorRol.text,
                  
                  };

                  ServicesJuntaAdministrativa.crearJuntaAdmin(juntaadmin);

                 Get.to(() => Home());
              
              },
              child: Text('Registrar')),
        ]);
      },
    );
  }
}
