import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil_integradora/pages/cameracontroller.dart';
import 'package:movil_integradora/pages/acerca_de.dart';
import 'package:movil_integradora/pages/controllers.dart';
import 'package:movil_integradora/pages/soporte.dart';
import 'package:movil_integradora/widgets/manual_cards.dart';

class Manual extends StatelessWidget {
  const Manual({super.key});

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
          SizedBox(width: 16),
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
                  image: AssetImage("assets/img/Manual3.png"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.5),
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
                                "Manual de usuario",
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
                    "Aprende cómo usar nuestro producto",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Hemos diseñado este manual de usuario para ayudar a nuestros clientes y evitar inconvenientes con nuestro producto.",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  const ManualCard(
                    title: "Programacion antes del uso",
                    description: "Revision previa y pruebas iniciales",
                    steps: [
                      "1. Asegúrate de que todas las conexiones eléctricas estén firmes y en buen estado.",
                      "2. Verifica que las hélices estén libres de obstrucciones y giren sin dificultad.",
                      "3. Espere hasta que el dispositivo complete su inicio.",
                      "4. Realiza una prueba en tierra firme para verificar que los controles del barco respondan correctamente",
                      "5. Comprueba que no haya fugas visibles en la estructura del casco"
                    ],
                    imagePath: "assets/img/Manual.png",
                  ),
                  const SizedBox(height: 20),
                  const ManualCard(
                    title: "Proceso de  uso",
                    description: "Encendido, Manejo, Conexion y sincronizacion",
                    steps: [
                      "1. Verifica que las baterías estén cargadas tanto en el barco como en el control remoto.",
                      "2. Enciende primero el control remoto y luego el barco para asegurar la sincronización.",
                      "3. Asegúrate de que el control remoto esté conectado al barco. Esto puede indicarse mediante una luz LED o una señal audible.",
                      "4. Familiarízate con los controles básicos: Acelerador: Controla la velocidad, Dirección: Gira el barco hacia la izquierda o derecha."
                    ],
                    imagePath: "assets/img/Manual.png",
                  ),
                  const SizedBox(height: 20),
                  const ManualCard(
                    title: "Proceso de  uso",
                    description: "Distancia maxima y apagado",
                    steps: [
                      "1. No alejes el barco más allá del rango del control remoto, que suele ser de 30-50 metros, dependiendo del modelo.",
                      "2. Al finalizar, apaga primero el barco y luego el control remoto.",
                      "3. Recuerda usar el barco en aguas tranquilas para mayor estabilidad y control.",
                    ],
                    imagePath: "assets/img/Manual.png",
                  ),
                  const SizedBox(height: 20),
                  const ManualCard(
                    title: "Cuidados, pasos iniciales",
                    description:
                        "Mantenimiento al casco, componentes y baterias",
                    steps: [
                      "1. Limpia el casco con un paño húmedo después de cada uso para retirar residuos o salitre si se usó en agua salada.",
                      "2. Inspecciona regularmente para asegurarte de que no haya grietas o fugas.",
                      "3. Asegúrate de que los compartimientos eléctricos estén bien sellados para evitar la entrada de agua.",
                      "4. Almacena las baterias en un lugar fresco y seco para prolongar su vida util."
                    ],
                    imagePath: "assets/img/Manual.png",
                  ),
                  const SizedBox(height: 20),
                  const ManualCard(
                    title: "Cuidados,  segundos pasos",
                    description:
                        "Almacenamiento y cuidado de los motores/elices",
                    steps: [
                      "1. Guarda el barco en un lugar seco, protegido del polvo y la luz directa del sol.",
                      "2. Evita colocar objetos pesados encima que puedan dañar la estructura.",
                      "3. Revisa que no haya obstrucciones en las hélices antes y después de cada uso.",
                      "4. Si notas ruido anormal en los motores, realiza una limpieza o lubricación según las indicaciones del fabricante."
                    ],
                    imagePath: "assets/img/Manual.png",
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
