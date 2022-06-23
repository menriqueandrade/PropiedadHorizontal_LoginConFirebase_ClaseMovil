// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, unused_field, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unused_label

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/coopropietarios_service.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/search_coopropietarios.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';



class AgregarCoopropietarios extends StatefulWidget {
  @override
  State<AgregarCoopropietarios> createState() =>
      _AgregarCoopropietariosState();
}

class _AgregarCoopropietariosState
    extends State<AgregarCoopropietarios> {
  TextEditingController _controladorNombre = TextEditingController();
  TextEditingController _controladorPago = TextEditingController();
  TextEditingController _controladorCedula = TextEditingController();
  TextEditingController _controladorNumerovivienda = TextEditingController();
  TextEditingController _controladorCuotasp = TextEditingController();

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
                            'assets/propietarios.png',
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
                              _TextFieldPago(controladorPago: _controladorPago)),
                              
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _TextFieldCedula(controladorCedula: _controladorCedula)),
                              
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _TextFieldNumerovivienda(controladorNumerovivienda: _controladorNumerovivienda)),
                              
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _TextFieldCuotaspendientes(controladorCuotasp: _controladorCuotasp)),
                      _ButtonEntrar(
                        controladorNombre: _controladorNombre,
                        controladorPago: _controladorPago,
                        controladorCedula: _controladorCedula,
                        controladorNumerovivienda: _controladorNumerovivienda,
                        controladorCuota:_controladorCuotasp
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

class _TextFieldPago extends StatelessWidget {
  const _TextFieldPago({
    Key? key,
    required TextEditingController controladorPago,
  })  : _controladorPago = controladorPago,
        super(key: key);

  final TextEditingController _controladorPago;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _controladorPago,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Valor de pago',
            hintText: "50.000",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorPago.clear();
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
          keyboardType: TextInputType.emailAddress,
          controller: _controladorCedula,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Cedula',
            hintText: "1065841847",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorCedula.clear();
              },
            ),
          ),
        );
      },
    );
  }
}

class _TextFieldNumerovivienda extends StatelessWidget {
  const _TextFieldNumerovivienda({
    Key? key,
    required TextEditingController controladorNumerovivienda,
  })  : _controladorNumerovivienda = controladorNumerovivienda,
        super(key: key);

  final TextEditingController _controladorNumerovivienda;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _controladorNumerovivienda,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Vivienda',
            hintText: "Numero de casa o vivienda",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorNumerovivienda.clear();
              },
            ),
          ),
        );
      },
    );
  }
}

class _TextFieldCuotaspendientes extends StatelessWidget {
  const _TextFieldCuotaspendientes({
    Key? key,
    required TextEditingController controladorCuotasp,
  })  : _controladorCuotasp = controladorCuotasp,
        super(key: key);

  final TextEditingController _controladorCuotasp;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _controladorCuotasp,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Cuotas a pagar',
            hintText: "Numero de cuotas",
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            filled: true,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controladorCuotasp.clear();
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
    required TextEditingController controladorPago,
    required TextEditingController controladorCedula,
    required TextEditingController controladorNumerovivienda,
    required TextEditingController controladorCuota,
    
  })  : _controladorNombre = controladorNombre,
        _controladorPago = controladorPago,
         _controladorCedula = controladorCedula,
        _controladorNumerovivienda = controladorNumerovivienda,
        _controladorCuotasp = controladorCuota,

        super(key: key);

  final TextEditingController _controladorNombre;
  final TextEditingController _controladorPago;
   final TextEditingController _controladorCedula;
  final TextEditingController _controladorNumerovivienda;
   final TextEditingController _controladorCuotasp;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                var coopropietarios = <String, dynamic>{
                    'nombrecoopropietarios': _controladorNombre.text,
                    'pagoscoopropietarios': _controladorPago.text,
                    'cedulacoopropietarios': _controladorCedula.text,
                    'numeroviviendacoopropietarios': _controladorNumerovivienda.text,
                    'cuotascoopropietarios': _controladorCuotasp.text,
                  
                  };

                  PeticionesCoop.crearCoopropietarios(coopropietarios);

                 Get.to(() => Home());
              
              },
              child: Text('Registrar')),
        ]);
      },
    );
  }
}
