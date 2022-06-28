// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/prehome/login_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _MyAppState();
}

class _MyAppState extends State<IntroScreen> {
  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Material App Bar'),
          // ),
          body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _Intro_1(),
              _Intro_2(),
              _Intro_3(),

              //  _Pagina('Pagina 2', Colors.red),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const WormEffect(),
                    onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceOut),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class _Intro_1 extends StatefulWidget {
  const _Intro_1({
    Key? key,
  }) : super(key: key);

  @override
  State<_Intro_1> createState() => _Intro_1State();
}

class _Intro_1State extends State<_Intro_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          Stack(children: [_Introinicio()])
        ],
      ),
    );
  }
}

class _Introinicio extends StatefulWidget {
  const _Introinicio({
    Key? key,
  }) : super(key: key);

  @override
  State<_Introinicio> createState() => _IntroinicioState();
}

class _IntroinicioState extends State<_Introinicio> {
  @override
  Widget build(BuildContext context) {
    const urlImageIntro1_1 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653320005/assetos/bienes3_mbwowk.png';
    const urlImageIntro1_2 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653320005/assetos/bienes4_bhw3mx.png';
    const urlImageIntro1_3 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653320005/assetos/bienes1_qwgpvq.png';
    return Stack(
      children: [
        _backgroundImage(),
        Positioned(
          right: -100,
          top: 30,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(urlImageIntro1_1),
                    fit: BoxFit.fill,
                  )),
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   right: 100,
        //   top: 120,
        //   child: Stack(
        //     children: [
        //       Text("TEXTO DE PRESENTACION PARA ESTA SECCION",
        //           textAlign: TextAlign.justify)
        //     ],
        //   ),
        // ),
        Positioned(
          right: 0,
          top: 250,
          child: Stack(
            children: [
              Container(
                height: 10,
                width: 500,
                color: Color.fromARGB(175, 7, 205, 255),
              ),
            ],
          ),
        ),
        Positioned(
          right: 190,
          top: 250,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                // color: Colors.amber,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(urlImageIntro1_2),
                  fit: BoxFit.fill,
                )),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 450,
          child: Stack(
            children: [
              Container(
                height: 10,
                width: 500,
                color: Color.fromARGB(127, 7, 205, 255),
              ),
            ],
          ),
        ),
        Positioned(
          right: -80,
          top: 450,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                // color: Colors.amber,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(urlImageIntro1_3),
                  fit: BoxFit.fill,
                )),
              ),
            ],
          ),
        ),
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
      child: Image.asset(
        'assets/fondo.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class _Intro_2 extends StatefulWidget {
  const _Intro_2({
    Key? key,
  }) : super(key: key);

  @override
  State<_Intro_2> createState() => _Intro_2State();
}

class _Intro_2State extends State<_Intro_2> {
  @override
  Widget build(BuildContext context) {
    const urlImageIntro1_2 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653261979/assetos/comercial_o81tva.png';
    const urlImageIntro2_2 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653261979/assetos/residencia_ykxnqd.png';
    const urlImageIntro3_2 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653261979/assetos/mixta_ciyvfc.png';
    return Stack(children: [
      _backgroundImage(),
      Positioned(
        right: 10,
        top: 10,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(urlImageIntro1_2),
                fit: BoxFit.fill,
              )),
            ),
          ],
        ),
      ),
      Positioned(
          right: 120,
          top: 140,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                //color: Colors.amber,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(urlImageIntro2_2),
                  fit: BoxFit.fill,
                )),
              )
            ],
          )),
      Positioned(
          right: -5,
          top: 290,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                //color: Colors.amber,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(urlImageIntro3_2),
                  fit: BoxFit.fill,
                )),
              )
            ],
          )),
      Positioned(
          right: 20,
          top: 540,
          child: Stack(
            children: [
              Text(
                "Bienvenido a Propiedad Horizontal",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              )
            ],
          )),
    ]);
  }
}

class _Intro_3 extends StatefulWidget {
  const _Intro_3({
    Key? key,
  }) : super(key: key);

  @override
  State<_Intro_3> createState() => _Intro_3State();
}

class _Intro_3State extends State<_Intro_3> {
  @override
  Widget build(BuildContext context) {
    const urlImageIntro3_1 =
        'https://res.cloudinary.com/dwwwryqzg/image/upload/v1653376470/assetos/vamos_hzvmcw.png';
    return Stack(children: [
      _backgroundImage(),
      Positioned(
        right: 60,
        top: 200,
        child: Container(
          height: 200,
          width: 300,
          // color: Colors.amber,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(urlImageIntro3_1),
            fit: BoxFit.fill,
          )),
        ),
      ),
      Positioned(
        right: 163,
        top: 600,
        child: Stack(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text("Vamos?"))
          ],
        ),
      ),
    ]);
  }
}
