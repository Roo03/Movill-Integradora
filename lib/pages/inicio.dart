import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil_integradora/widgets/custom_buttom.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/Fondo.jpg"), 
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Text(
                "AquaClean",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  height: 1.5,
                ),
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 150),
            child: Column(
              children: [
               ButtomCustom(
                color: Color.fromARGB(0, 34, 93, 24), 
                iconVisible: false, text:"Comenzar", 
                onPressed:() {}),
               SizedBox(
                height: 16,
               ),
               ],
            ),
          )
        ],
      ),
    ));
  }
}
