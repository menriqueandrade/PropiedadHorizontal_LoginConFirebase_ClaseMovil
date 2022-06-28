import 'package:flutter/material.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/widgets/invoice_table.dart';
import 'package:propiedadh_firebase/ui/screens/home/screens/gestion_pagos/imprimir_factura/screens/widgets/save_btn.dart';
import '../../Components/image_builder.dart';
import '../../Components/spacer.dart';

class FacturaPDF extends StatefulWidget {
  const FacturaPDF({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FacturaPDF> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FacturaPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.00),
            child: Column(
              children: const [
                Text("vijaycreations",
                    style: TextStyle(
                        fontSize: 25.00, fontWeight: FontWeight.bold)),
                HeightSpacer(myHeight: 10.00),
                Divider(),
                Align(
                  alignment: Alignment.topRight,
                  child: ImageBuilder(
                    imagePath: "assets/image.png",
                    imgWidth: 250,
                    imgheight: 250,
                  ),
                ),
             //   InvoiceBuilder(),
                HeightSpacer(myHeight: 15.00),
                Text(
                  "Thanks for choosing our service!",
                  style: TextStyle(color: Colors.grey, fontSize: 15.00),
                ),
                HeightSpacer(myHeight: 5.00),
                Text(
                  "Contact the branch for any clarifications.",
                  style: TextStyle(color: Colors.grey, fontSize: 15.00),
                ),
                HeightSpacer(myHeight: 15.00),
                SaveBtnBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
