import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/home/home.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/prehome/login_screen/login_screen.dart';

import 'ui/screens/authentication/login/login_screen.dart';
import 'ui/screens/authentication/login/editar_perfil.dart';
import 'ui/screens/authentication/login/perfil_guardado.dart';
import 'ui/screens/content/content_page.dart';
import 'ui/screens/home/screens/prehome/intro_screen/intro_screen.dart';
import 'ui/screens/home/screens/prehome/splash/splash_screen.dart';

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
        '/splash': (context) => SplashScreen(),
        '/intro': (context) => IntroScreen(),
        '/auth': (context) => LoginScreen(),
        '/perfil': (context) => Perfil_Guardado(),
        '/content': (context) => Principal(),
        '/home': (context) => Home(),
        
        
      },
      home: SplashScreen(),
    );
  }
}
