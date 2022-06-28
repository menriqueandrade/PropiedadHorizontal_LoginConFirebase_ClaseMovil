// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/prehome/intro_screen/intro_screen.dart';


class SplashScreen extends StatefulWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(
         Duration(milliseconds: 4000),
         () =>  Get.to(() => IntroScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundImage(),
        Stack(children: [
          Column(
            children: <Widget>[
              Spacer(),
              AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 200),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: .6,
                    child: Image.asset('assets/logo.png',
                        fit: BoxFit.fill, width: 200, height: 300),
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ])
      ],
    );
  }
}

class _backgroundImage extends StatelessWidget {
  const _backgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset('assets/fondo.png',
            fit: BoxFit.cover, width: double.infinity, height: double.infinity)
       
        );
  }
}
