import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';
import 'package:propiedadh_firebase/domain/controller/peticionesfotos.dart';
import 'package:propiedadh_firebase/services/search.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/editar_perfil.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/login_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';


class Perfil_Guardado extends StatefulWidget {
  @override
  _Perfil_LogueadoState createState() => _Perfil_LogueadoState();
}

class _Perfil_LogueadoState extends State<Perfil_Guardado> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Controllerauth controluser = Get.find();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlDireccion = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Informacion de la cuenta"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
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
              ),
              Text(controluser.nombre_user),
              Text(controluser.apellido_user),Text(controluser.direccion_user),Text(controluser.telefono_user),
              TextField(
                controller: controlApellido,
                decoration: InputDecoration(labelText: "Correo :",prefixText:  controluser.name),
              ),
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre",prefixText: controluser.nombre_user),
              ),TextField(
                controller: controlApellido,
                decoration: InputDecoration(labelText: "Apellido",prefixText: controluser.apellido_user),
              ),
              TextField(
                controller: controlDireccion,
                decoration: InputDecoration(labelText: "Direccion",prefixText: controluser.direccion_user),
              ),
              TextField(
                controller: controlTelefono,
                decoration: InputDecoration(labelText: "Telefono",prefixText: controluser.telefono_user),
              ),
               
              ElevatedButton(
                child: Text("Guardar Perfil"),
                onPressed: () {
                  var catalogo = <String, dynamic>{
                    'id_user': controluser.uid,
                    'nombre': controlNombre.text,
                    'apellido': controlApellido.text,
                    'direccion': controlDireccion.text,
                    'telefono': controlTelefono.text,
                    'foto': ''
                  };

                  PeticionesFotos.crearcatalogo(catalogo, _image);
                 Get.to(() => Home());
                },
              ),
              ElevatedButton(
                child: Text("Editar info personal"),
                onPressed: () async {
               
                   Get.to(() => EditarPerfil());
                }, 
              ),
              ElevatedButton(
                child: Text("Cerrar sesion"),
                onPressed: () async {
                  await signOut();
                   Get.to(() => Login());
                }, 
              )
            ],
          ),
        ),
      ),
    );
  }
  signOut() async {
        await auth.signOut();
      }

//Seleccionar la camara o la galeria

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
}
