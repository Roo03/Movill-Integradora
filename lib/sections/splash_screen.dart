import 'package:flutter/material.dart';
import 'dart:async';

import 'package:movil_integradora/sections/inicio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveLeft = false;
  bool _showText = false;

  @override
  void initState() {
    super.initState();


    Timer(const Duration(seconds: 1), () {
      setState(() {
        _moveLeft = true; 
      });

      Timer(const Duration(seconds: 1), () {
        setState(() {
          _showText = true; 
        });

        
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Inicio()),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 15, 82, 96), Color.fromARGB(255, 33, 103, 117), Color.fromARGB(255, 30, 129, 171)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
          
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              left: _moveLeft ? 30 : MediaQuery.of(context).size.width / 2 - 75,
              top: MediaQuery.of(context).size.height / 2 - 75,
              child: Image.asset(
                'assets/img/LogoSplash.png',
                width: 150,
                height: 150,
              ),
            ),
            
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child:  Text(
                    'AquaClean',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
