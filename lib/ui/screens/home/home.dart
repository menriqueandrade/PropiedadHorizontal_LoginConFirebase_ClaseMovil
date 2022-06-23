// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/perfil_guardado.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/editar_perfil.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/listado_juntaadministrativa.dart';

import 'screens/copropietarios_screens/agregar_coopropietarios.dart';
import 'screens/copropietarios_screens/listado_coopropietarios.dart';
import 'screens/gestion_pagos/gestion_pagos_screen.dart';
import 'screens/juntaadministrativa_screens/agregar_juntaadministrativa.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controllerauth controluser = Get.find();
  @override
  Widget build(BuildContext context) {
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
                  Get.to(() => Perfil_Guardado());
                },
                icon: Icon(
                  Icons.person,
                ),
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
        title: Center(
            child: Text("Home", style: TextStyle(color: Colors.lightBlue))),
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
                  child: Text(controluser.name.substring(0,1).toUpperCase(), style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _JuntaAdminCard(),
              SizedBox(
                height: 30,
              ),
              _CoopropietariosCard(),
              SizedBox(
                height: 30,
              ),
              GestionDePagos(),
            ],
          ),
        ),
      )),
    );
  }
}

class _JuntaAdminCard extends StatelessWidget {
  const _JuntaAdminCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Get.to(() => Listado_JuntaAdministrativa());
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
            image: DecorationImage(
                image: AssetImage('assets/juntaadmin.png'), fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.white.withOpacity(.2),
            Colors.white12.withOpacity(.1),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Junta Administrativa",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoopropietariosCard extends StatelessWidget {
  const _CoopropietariosCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Get.to(() => Listado_Coopropietarios());
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
            image: DecorationImage(
                image: AssetImage('assets/propietarios.png'), fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.white.withOpacity(.2),
            Colors.white12.withOpacity(.1),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Coopropietarios",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GestionDePagos extends StatelessWidget {
  const GestionDePagos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Get.to(() => GestionPagosScreen());
       
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
            image: DecorationImage(
                image: AssetImage('assets/propietarios.png'),
                fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.white.withOpacity(.2),
            Colors.white12.withOpacity(.1),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Gestion de Pagos",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
