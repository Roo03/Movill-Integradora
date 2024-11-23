import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:camera/camera.dart';
import 'package:movil_integradora/pages/Acerca%20de.dart';
import 'package:movil_integradora/pages/manual.dart';
import 'package:movil_integradora/pages/soporte.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _isFullScreen = false;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _fetchCameras();
  }

  Future<void> _fetchCameras() async {
    _cameras = await availableCameras();
  }

  Future<void> _initializeCamera() async {
    if (_cameras.isNotEmpty) {
      _cameraController = CameraController(
        _cameras[0], // Cámara trasera
        ResolutionPreset.medium,
      );

      try {
        await _cameraController.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      } catch (e) {
        dev.log("Error inicializando la cámara: $e");
      }
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  void _toggleDrawer() {
    if (!_isFullScreen) {
      setState(() {
        _isDrawerOpen = !_isDrawerOpen;
      });
    }
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Detectar la orientación de la pantalla
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 44, 63),
      extendBodyBehindAppBar: true,
      appBar: _isFullScreen
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: const [
                Icon(
                  FeatherIcons.search,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
              ],
            ),
      drawer: _isFullScreen
          ? null
          : Drawer(
              elevation: 0,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.6),
                          Colors.blue.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/img/Logo.jpeg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.control_camera),
                    title: const Text("Controlador"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Controller()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manual"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Manual()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_mail),
                    title: const Text("Soporte"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Soporte()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("Acerca de"),
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
      body: Center(
        child: isLandscape
            ? Row(
                children: [
                  // Cámara centrada a la izquierda en horizontal
                  Expanded(
                    child: _isCameraInitialized
                        ? _isFullScreen
                            ? CameraPreview(_cameraController)
                            : Container(
                               width: 100,
                                height: 250,
                                margin: const EdgeInsets.only(left: 50),
                                 // Centramos 50 píxeles desde la izquierda
                                child: CameraPreview(_cameraController),
                              )
                        : Container(
                            width: 100,
                            height: 250,
                            margin: const EdgeInsets.only(left: 50),
                            color: const Color.fromARGB(255, 43, 57, 87), // Color de fondo cuando la cámara no está conectada
                            child: const Center(
                              child: Text(
                                "Cámara no conectada",
                                style: TextStyle(
                                  color: Colors.white, // Color del texto
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                  // Botones a la derecha en horizontal
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isCameraInitialized)
                        ElevatedButton(
                          onPressed: _toggleFullScreen,
                          child: Text(
                            _isFullScreen
                                ? "Salir de Pantalla Completa"
                                : "Pantalla Completa",
                          ),
                        ),
                      ElevatedButton(
                        onPressed:
                            _isCameraInitialized ? null : _initializeCamera,
                        child: const Text("Conectar Cámara"),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // En vertical, centrar la cámara en la parte superior
                  _isCameraInitialized
                      ? _isFullScreen
                          ? Expanded(
                              child: CameraPreview(_cameraController),
                            )
                          : SizedBox(
                              width: 300,
                              height: 200,
                              child: CameraPreview(_cameraController),
                            )
                      : Container(
                          width: 300,
                          height: 200,
                          color: const Color.fromARGB(255, 43, 57, 87),
                               
                          child: const Center(
                            child: Text(
                              "Cámara no conectada",
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 16),
                  // Botones debajo en vertical
                  if (_isCameraInitialized)
                    ElevatedButton(
                      onPressed: _toggleFullScreen,
                      child: Text(
                        _isFullScreen
                            ? "Salir de Pantalla Completa"
                            : "Pantalla Completa",
                      ),
                    ),
                  ElevatedButton(
                    onPressed: _isCameraInitialized ? null : _initializeCamera,
                    child: const Text("Conectar Cámara"),
                  ),
                ],
              ),
      ),
    );
  }
}
