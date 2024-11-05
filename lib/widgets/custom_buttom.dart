import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtomCustom extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final IconData icon;
  final bool iconVisible;
  final Color textColor;

  const ButtomCustom({
    required this.color,
    required this.text,
    required this.textColor,
    required this.onPressed,
    required this.iconVisible,
    this.icon = Icons.arrow_forward_ios,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        
      },
      onExit: (event) {
        
      },
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8), 
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconVisible) Icon(icon, color: textColor),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.inter(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
