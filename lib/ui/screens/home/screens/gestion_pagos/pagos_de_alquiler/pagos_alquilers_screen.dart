import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/authentication/login/login_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/habitantes_morosos/residentes_morosos_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/habitantes-paz-y-salvo/habitantes_paz_salvo_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pago_administracion/pago_administracion.screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/area_de_loduteca/area_de_ludoteca_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/area_de_piscina/area_de_piscina_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/canchas_deportiva/cancha_deportiva_screen.dart';

import 'salon_de_eventos/salon_de_eventos_screen.dart';

class PagosDeAlquiler extends StatefulWidget {
  @override
  State<PagosDeAlquiler> createState() => _PagosDeAlquilerState();
}

class _PagosDeAlquilerState extends State<PagosDeAlquiler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
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
            child: Text("Gestion de Alquiler", style: TextStyle(color: Colors.lightBlue))),
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
                  child: Icon(Icons.payments),
                ),
              ),
            ),
          ),
        ],
      ),
        body: Center(
          child: Wrap(
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                        Get.to(() => SalondeEventosScreen());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 132,
                      child: Column(children: [
                        Hero(
                          tag: 'salonevento',
                          child: Image.network(
                            'https://i.pinimg.com/originals/1b/5f/9d/1b5f9d8479a8438e2512c6f53315815e.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "SALON DE EVENTOS",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),

              // ignore: prefer_const_constructors
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                   Get.to(() => AreadePiscinaScreen());
                    
                  },
                  child: SizedBox(
                      width: 150,
                      height: 132,
                      child: Column(children: [
                        Hero(
                          tag: 'areapiscina',
                          child: Image.network(
                            'https://st.hzcdn.com/simgs/pictures/pools/pool-area-modern-paving-inc-img~0751f73a073ca752_4-7484-1-75843d6.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "AREA DE PISCINA",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                   Get.to(() => CanchaDeportivaScreen());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 132,
                      child: Column(children: [
                        Hero(
                          tag: 'canchadeportiva',
                          child: Image.network(
                            'https://www.lapatilla.com/wp-content/uploads/2015/01/Foto-cancha-I-2.jpg?resize=640%2C480',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "CANCHA DEPORTIVA",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Get.to(() => AreadeLudotecaScreen());
                  },
                  child: SizedBox(
                      width: 150,
                      height: 132,
                      child: Column(children: [
                        Hero(
                          tag: 'arealudoteca',
                          child: Image.network(
                            'https://www.nevasport.com/fotos/030210/312495-Nuevo-servicio-de-ludoteca-infantil-en-Valdezcaray_tn900x.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "AREA DE LUDOTECA",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
             
 
            ],
          ),
        ),
      ),
    );
  }
}
