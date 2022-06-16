import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controllerauth controluser = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controluser.emailf)),
            Text(controluser.uid),
          ],
        ),
      ),
    );
  }
}
