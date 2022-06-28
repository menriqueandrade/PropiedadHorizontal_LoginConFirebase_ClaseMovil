import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propiedadh_firebase/domain/controller/autenticaciones.dart';
import 'package:propiedadh_firebase/services/coopropietarios_services/coopropietarios_service.dart';

import '../../Components/spacer.dart';

class InvoiceBuilder extends StatefulWidget {
  const InvoiceBuilder({Key? key, this.iddoc, this.pos, this.posicion, required this.perfil}) : super(key: key);
 final iddoc;
  final pos;
  final posicion;
  //final List<JuntaAdministrativa> juntaadmin;
  final List perfil;
  @override
  State<InvoiceBuilder> createState() => _InvoiceBuilderState();
}

class _InvoiceBuilderState extends State<InvoiceBuilder> {
  
TextEditingController controlNombre = TextEditingController();
TextEditingController controlVivienda = TextEditingController();
TextEditingController controlPago = TextEditingController();

  @override
  void initState() {
    controlNombre = TextEditingController(
        text: widget.perfil[widget.pos]['nombrecoopropietarios']);
     controlVivienda =
         TextEditingController(text: widget.perfil[widget.pos]['numeroviviendacoopropietarios']);
          controlPago =
         TextEditingController(text: widget.perfil[widget.pos]['pagoscoopropietarios']);
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Controllerauth controluser = Get.find();

    return Column(
      children: [
       
        const HeightSpacer(myHeight: 10.00),
        tableHeader(),
        for (var i = 0; i < 1; i++) buildTableData(i),
        buildTotal(),
      ],
    );
  }

  Widget header(String name) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(
            Icons.file_open,
            color: Colors.indigo,
            size: 35.00,
          ),
          WidthSpacer(myWidth: 5.5),
          Text(
            "Invoice",
            style: TextStyle(fontSize: 23.00, fontWeight: FontWeight.bold),
          )
        ],
      );

  Widget tableHeader() => Container(
        color: const Color.fromARGB(255, 189, 255, 191),
        width: double.infinity,
        height: 36.00,
        child: const Center(
          child: Text(
            "Aprobado",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 107, 4),
                fontSize: 20.00,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget buildTableData(int i) => Container(
        color: i % 2 != 0
            ? const Color.fromARGB(255, 236, 236, 236)
            : const Color.fromARGB(255, 255, 251, 251),
        width: double.infinity,
        height: 36.00,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              i == 2
                  ? const Text(
                      "Tax",
                      style: TextStyle(
                          fontSize: 18.00, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      controlNombre.text,
                      style: const TextStyle(
                          fontSize: 18.00, fontWeight: FontWeight.bold),
                    ),
              i == 2
                  ? const Text(
                      "\$ 2.50",
                      style: TextStyle(
                          fontSize: 18.00, fontWeight: FontWeight.normal),
                    )
                  : Text(
                      "\$ ${controlPago.text}",
                      style: const TextStyle(
                          fontSize: 18.00, fontWeight: FontWeight.normal),
                    ),
            ],
          ),
        ),
      );

  Widget buildTotal() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          color: const Color.fromARGB(255, 255, 251, 251),
          width: double.infinity,
          height: 36.00,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Text(
                "\$ ${controlPago.text}",
                style: TextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 107, 4),
                ),
              ),
            ],
          ),
        ),
      );
}


