import 'package:flutter/material.dart';
import 'package:movil_integradora/pages/acerca_de.dart';
import 'package:movil_integradora/pages/manual.dart';
import 'package:movil_integradora/pages/soporte.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class Cameracontroller extends StatefulWidget {
  const Cameracontroller({super.key});

  @override
  State<Cameracontroller> createState() => _CameracontrollerState();
}

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

class _CameracontrollerState extends State<Cameracontroller> {
  final TextEditingController _ipController = TextEditingController();
  String? streamUrl;
  bool isConnected = false;
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
                            builder: (context) => const Cameracontroller()),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _ipController,
                decoration: InputDecoration(
                  labelText: 'Ingrese la IP del barco',
                  border: const OutlineInputBorder(),
                  errorText:
                      _ipController.text.isEmpty ? 'La IP es requerida' : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_ipController.text.isNotEmpty) {
                  setState(() {
                    streamUrl =
                        'http://${_ipController.text}/stream'; // Construir la URL
                    isConnected = !isConnected; // Cambiar el estado de conexión
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor ingrese una IP válida.')),
                  );
                }
              },
              child: Text(isConnected ? 'Desconectar' : 'Conectar'),
            ),
            const SizedBox(height: 20),
            isConnected && streamUrl != null
                ? Container(
                    height: 300,
                    width: 400,
                    child: Mjpeg(
                      isLive: true,
                      stream: streamUrl!,
                    ),
                  )
                  
                : const Text('Esperando conexión...'),
          ],
        ),
      ),
    );
  }
}
