// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, unused_field, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unused_label

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';

class AgregarJuntaAdministrativa extends StatefulWidget {
  @override
  State<AgregarJuntaAdministrativa> createState() =>
      _AgregarJuntaAdministrativaState();
}

String? _vista = "Seleccione el tipo ";

class _AgregarJuntaAdministrativaState
    extends State<AgregarJuntaAdministrativa> {
  List<String> _tipoUsuario = ["Tesorero", "Administrativo", "Gerencia"];

  ImagePicker picker = ImagePicker();
  var _image;

  _galeria() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      //_image = File(image!.path);
    });
  }

  _camara() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      // _image = File(image!.path);
    });
  }

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Imagen de Galeria'),
                      onTap: () {
                        _galeria();
                        Get.back();
                        // Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Capturar Imagen'),
                    onTap: () {
                      _camara();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  TextEditingController _controladorNombre = TextEditingController();
  TextEditingController _controladorRol = TextEditingController();
  TextEditingController _controladorCedula = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: Scaffold(
          extendBodyBehindAppBar: true,
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
                child: Text("Agregar Junta Administrativa",
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
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
                        height: 100,
                      ),
                   
                      GestureDetector(
                        onTap: () {
                          _opcioncamara(context);
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.blue[200],
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _TextFieldNombre(
                              controladorNombre: _controladorNombre)),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          items: _tipoUsuario.map((String a) {
                            return DropdownMenuItem(value: a, child: Text(a));
                          }).toList(),
                          onChanged: (val) => {_vista = val},
                          hint: Text('Seleccione el tipo'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _TextFieldCedula(
                              controladorCedula: _controladorCedula)),
                      _ButtonEntrar(
                        controladorNombre: _controladorNombre,
                        vista: _vista,
                        controladorCedula: _controladorCedula,
                        image: _image,
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

class _TextFieldCedula extends StatelessWidget {
  const _TextFieldCedula({
    Key? key,
    required TextEditingController controladorCedula,
  })  : _controladorCedula = controladorCedula,
        super(key: key);

  final TextEditingController _controladorCedula;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          controller: _controladorCedula,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Cedula',
            hintText: "Numero de cedula",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                // _controladorCedula.clear();
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
  var _image;
  _ButtonEntrar({
    Key? key,
    required TextEditingController controladorNombre,
    //  required TextEditingController controladorRol,
    required TextEditingController controladorCedula,
    required image,
    required vista,
  })  : _controladorNombre = controladorNombre,
        //    _controladorRol = controladorRol,
        _controladorCedula = controladorCedula,
        _image = image,
        super(key: key);

  final TextEditingController _controladorNombre;
  //final TextEditingController _controladorRol;
  final TextEditingController _controladorCedula;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                var juntaadmin = <String, dynamic>{
                  'nombrejuntaadmin': _controladorNombre.text,
                  'roljuntaadmin': _vista,
                  'cedulajuntaadmin': _controladorCedula.text,
                  'foto': ""
                };

                ServicesJuntaAdministrativa.crearJuntaAdmin(juntaadmin, _image);

                Get.to(() => Home());
              },
              child: Text('Registrar')),
        ]);
      },
    );
  }
}
