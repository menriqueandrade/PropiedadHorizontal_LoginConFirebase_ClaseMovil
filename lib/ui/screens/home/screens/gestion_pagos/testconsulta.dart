import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class testsearch extends SearchDelegate {
 // static final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference listado = FirebaseFirestore.instance.collection('coopropietarios');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: listado.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            // ignore: prefer_const_constructors
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs.where(
                    (QueryDocumentSnapshot<Object?> element) => element['nombrecoopropietarios']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                            final String nombre = data.get('nombrecoopropietarios');
                            
                            return ListTile(
                              onTap: (){

                              },
                              title: Text(nombre),
                          
                              subtitle: Text(nombre),
                            );
                        }
                        )
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return Center(child: Text("Text vacio"),);
  }
}
