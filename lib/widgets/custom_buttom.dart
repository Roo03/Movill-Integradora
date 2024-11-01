import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtomCustom extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final IconData icon;
  const ButtomCustom({
    required this.color,
    required this.text,
    required this.onPressed,
    this.icon = Icons.arrow_forward_ios,
    super.key
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 53, 115, 44),
                  borderRadius: BorderRadius.circular(4)),
                  child: Center(
                  child: Text("Comenzar", style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight:FontWeight.w600 ,
                    fontSize: 16,
                    )),),
    );
  }
}