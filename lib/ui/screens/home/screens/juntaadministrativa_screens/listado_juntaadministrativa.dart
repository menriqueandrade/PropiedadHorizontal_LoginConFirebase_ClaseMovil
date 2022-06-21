
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/services/juntaadministrativa_services.dart';
import 'package:propiedadh_firebase/services/search.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/agregar_juntaadministrativa.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/juntaadministrativa_screens/editar_juntaadministrativa.dart';


class Listado_JuntaAdministrativa extends StatefulWidget {
 

  @override
  _Listado_JuntaAdministrativaState createState() => _Listado_JuntaAdministrativaState();
}

class _Listado_JuntaAdministrativaState extends State<Listado_JuntaAdministrativa> {
  Peticiones2 variablesjuntaadmin = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Junta Administrativa'),
        // actions: [
        //   IconButton(
        //       tooltip: 'Agregar Usuario de la Junta Administrativa',
        //       icon: Icon(Icons.add),
        //       onPressed: () {
              
        //       })
        // ],
      ),

      body: obtenerInformacion(context, variablesjuntaadmin.readItemsJuntaAdmin()),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            
            Get.to(() => AgregarJuntaAdministrativa());
            
            //obtenerInformacion(context, variablesjuntaadmin.readItemsJuntaAdmin());
          });
        },
        tooltip: 'Crear usuario juntaAdmin',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@override
Widget obtenerInformacion(BuildContext context, Stream<QuerySnapshot> ct) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaJuntaAdministrativa(juntaadministrativa: snapshot.data!.docs)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
    
  );

  
}

class VistaJuntaAdministrativa extends StatelessWidget {
  
  final List juntaadministrativa;

   VistaJuntaAdministrativa({required this.juntaadministrativa});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: juntaadministrativa.length == 0 ? 0 : juntaadministrativa.length,
        itemBuilder: (context, posicion) {
           print(juntaadministrativa[posicion].id);
          // print(juntaadministrativa[posicion].nombre);
           return ListTile(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ModificarJuntaAdministrativa(
                          perfil: juntaadministrativa,
                          pos: posicion,
                          iddoc: juntaadministrativa[posicion].id)));

               
              },
              onLongPress: () {
                //   ServicesJuntaAdministrativa.eliminarJuntaAdmin(juntaadministrativa[posicion].id);
               confirmaeliminarUsuario(context, juntaadministrativa[posicion].id);
              },
              leading: CircleAvatar(
                  child: FlutterLogo(
                size: 30,
              )),
               title: Text(
                 juntaadministrativa[posicion]['nombrejuntaadmin']
               ),
              subtitle: Text(juntaadministrativa[posicion]['roljuntaadmin']),
           //   trailing: CircleAvatar(child: Text(juntaadministrativa[posicion].rol))
              );
          // return Card(
          //   elevation: 2,
          //   child: Container(
          //     padding: const EdgeInsets.only(
          //         top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Row(
          //           children: [
          //             Text((juntaadministrativa[posicion]['nombre'])),
                     
                    
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 6.0,
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
          //           child: Text('Titulo'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 18.0),
          //           child: Text('Detalle'),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
         
        });
  }
  void confirmaeliminarUsuario(context, ideliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('Realmente Desea Eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              ServicesJuntaAdministrativa.eliminarJuntaAdmin(ideliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
}
