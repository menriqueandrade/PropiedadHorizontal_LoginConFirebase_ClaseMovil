import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/search_coopropietarios.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/salon_de_eventos/lista_alquileres_screen.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/pagos_de_alquiler/salon_de_eventos/seleccionar_residente_alquilar.dart';

class CanchaDeportivaScreen extends StatefulWidget {
  @override
  State<CanchaDeportivaScreen> createState() => _CanchaDeportivaScreenState();
}

class _CanchaDeportivaScreenState extends State<CanchaDeportivaScreen> {
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
                child: Text("Cancha deportiva",
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => ListaDeAlquileresScreen());
            },
            child: FaIcon(
              FontAwesomeIcons.list,
              color: Colors.white,
            ),
          ),
          body: Column(
            children: <Widget>[
              Hero(
                tag: 'canchadeportiva',
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(
                    'https://www.lapatilla.com/wp-content/uploads/2015/01/Foto-cancha-I-2.jpg?resize=640%2C480',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Cancha deportiva"),
                  subtitle: Text("Recuerda que tienes 5 días hábiles contados a partir de la fecha de tu compra, para ejercer el derecho de retracto. Aplica cuando el servicio no se hubiese comenzado a ejecutar o cuando su ejecución no sea anterior a 5 días hábiles."),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.to(
                                () => SeleccionarResidenteParaAlquilerScreen());
                            informacionUser(context);
                          },
                          child: Text("Alquilar")),
                      ElevatedButton(onPressed: () {}, child: Text("Salir"))
                    ],
                  ),
                ],
              )

              // Card(
              //   semanticContainer: true,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   elevation: 5,
              //   margin: EdgeInsets.all(10),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   child:
              // ),
            ],
          )),
    );
  }

  void informacionUser(
    context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Por Favor Leer!"),
          content: Text(
              'Tienes que tener en cuenta que si no estas paz y salvo no saldras en este listado para poder alquilar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Listo',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
