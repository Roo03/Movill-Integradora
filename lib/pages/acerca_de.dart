import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil_integradora/pages/cameracontroller.dart';
import 'package:movil_integradora/pages/controllers.dart';
import 'package:movil_integradora/pages/manual.dart';
import 'package:movil_integradora/pages/soporte.dart';

class Acercade extends StatelessWidget {
  const Acercade({super.key});

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 44, 63),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          SizedBox(
            width: 16,
          )
        ],
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 2, 45, 58),
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 81, 212, 204),
                    Color.fromARGB(255, 9, 51, 66)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/img/Logo.jpeg"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AquaClean",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    icon: Icons.control_camera,
                    text: "Controlador",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Controller()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    text: "Manual",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Manual()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.contact_mail,
                    text: "Soporte",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Soporte()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.info,
                    text: "Acerca de",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Acercade()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Botón de cierre con animación
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/Fondo3.jpg"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 44, right: 16, left: 16, bottom: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bienvenidos",
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Conoce",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Descubre",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Controla",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Aprende",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "¿Quienes somos?",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Somos un equipo comprometido con el cuidado del medio ambiente y la preservación de los recursos de agua naturales en Yucatán. Nuestra misión es ayudar con la limpieza de los cuerpos de agua para ayudar a su preservacion y limpieza.",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[50],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3)),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: Image(
                              image: AssetImage("assets/img/Contaminacion.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "¿Por qué hacemos esto?",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Los cenotes en Yucatán están sufriendo graves problemas de contaminación debido a la actividad humana, como la descarga de aguas residuales, el uso de fertilizantes y el turismo descontrolado. Estos cuerpos de agua subterráneos son esenciales para la biodiversidad y el suministro de agua, y su deterioro representa una amenaza ambiental significativa.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Cada miembro esta comprometido en aportar de la mejor manera posible a ayudar con el cuidado del medio ambiente.",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Lo que hacemos",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Gracias a este problema saltamos a la accion y a la contribucion para ayudar al medio ambiente y diseñamos nuestro producto El Guardian Del Agua.",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 500,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img/Guardian.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Diseñado para la limpieza y preservacion de los cuerpos de agua, principalmente ayudando a los cenotes a ser limpiados garantizando un mejor cuidado del patrimonio cultural yucateco .",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
