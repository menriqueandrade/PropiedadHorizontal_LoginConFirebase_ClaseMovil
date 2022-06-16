import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/authentication/login/login_screen.dart';
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
        '/content': (context) => Principal(),
      },
      home: Login(),
    );
  }
}
