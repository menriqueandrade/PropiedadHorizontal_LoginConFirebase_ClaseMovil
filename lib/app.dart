import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';

import 'ui/screens/authentication/login/login_screen.dart';
import 'ui/screens/authentication/login/editar_perfil.dart';
import 'ui/screens/authentication/login/perfil_guardado.dart';
import 'ui/screens/content/content_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Autenticacion Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/auth': (context) => Login(),
        '/perfil': (context) => Perfil_Guardado(),
        '/content': (context) => Principal(),
        '/home': (context) => Home(),
        
      },
      home: Login(),
    );
  }
}
