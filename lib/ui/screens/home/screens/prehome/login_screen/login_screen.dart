// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, unused_field, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unused_label

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';
import 'package:propiedadh_firebase/domain/controller/conectividad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailuser = TextEditingController();
  TextEditingController passwuser = TextEditingController();
  Controllerauth controluser = Get.find();
  late ConnectivityController connectivityController;

  @override
  void initState() {
    super.initState();
    connectivityController = Get.find<ConnectivityController>();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? passw = prefs.getString('pass');

    if (email != null) {
      setState(() {
        emailuser.text = email;
        passwuser.text = passw!;
        if (controluser.emailf != 'Sin Registro')
          _inicio(emailuser.text, passwuser.text);
      });
      return;
    }
  }

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      // Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _inicio(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.ingresarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/home');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/logou.jpg')),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailuser,
                    decoration: InputDecoration(hintText: 'Ingrese el Email'),
                  ),
                  TextField(
                    controller: passwuser,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (connectivityController.connected) {
                              _inicio(emailuser.text, passwuser.text);
                            } else {
                              GetSnackBar(
                                title: 'No esta conectado a un Red',
                                duration: Duration(seconds: 5),
                              );
                            }
                          },
                          icon: Icon(Icons.login,color: Colors.blueAccent,)),
                      IconButton(
                          onPressed: () {
                            if (connectivityController.connected) {
                              _login(emailuser.text, passwuser.text);
                            } else {
                              GetSnackBar(
                                title: 'No esta conectado a un Red',
                                duration: Duration(seconds: 5),
                              );
                            }
                          },
                          icon: Icon(Icons.app_registration_rounded,color: Colors.blueAccent))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
