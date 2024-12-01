import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil_integradora/pages/cameracontroller.dart';
import 'package:movil_integradora/pages/acerca_de.dart';
import 'package:movil_integradora/pages/manual.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Soporte extends StatefulWidget {
  const Soporte({super.key});

  @override
  State<Soporte> createState() => _SoporteState();
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

class _SoporteState extends State<Soporte> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final topicController = TextEditingController();
  final messageController = TextEditingController();

  String? _validarNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su nombre';
    } else if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value)) {
      return 'Solo se permiten letras';
    }
    return null;
  }

  String? _validarCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Por favor ingrese un correo válido';
    }
    return null;
  }

  Future<void> _enviarFormulario() async {
    const url = 'https://backend-aquaclean.onrender.com/api/contact';

    final body = {
      'name': nameController.text,
      'email': emailController.text,
      'topic': topicController.text,
      'message': messageController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gracias por su opinion')),
        );
        _formKey.currentState?.reset();
        _limpiarCampos();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error al enviar el formulario: ${response.reasonPhrase}',
            ),
          ),
        );
      }
    } catch (e) {
      // Error en la conexión
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo conectar con el servidor')),
      );
    }
  }

  void _limpiarCampos() {
    nameController.clear();
    emailController.clear();
    topicController.clear();
    messageController.clear();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/Manual.png"),
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
                                "Contactanos",
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
                    "Equipo para el soporte y atencion al cliente",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Gracias a tu opinion podemos cambiar y mejorar mas nuestra app, asi como atender opiniones que mejoren lo que hacemos, tu opinion cuenta, compartenos tu opinion",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre',
                            ),
                            validator: _validarNombre,
                            style: const TextStyle(color: Colors.white),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]*$'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'Correo Electrónico',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _validarCorreo,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              labelText: 'Mensaje',
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese un mensaje';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: topicController,
                            decoration: const InputDecoration(
                              labelText: 'Tema a tratar',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese un asunto';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _enviarFormulario();
                                  // Mostrar mensaje de confirmación
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Formulario Enviado'),
                                    ),
                                  );
                                 
                                  nameController.clear();
                                  emailController.clear();
                                  messageController.clear();
                                  topicController.clear();
                                }
                              },
                              child: const Text('Enviar'),
                            ),
                          ),
                        ],
                      ), 
                    ),
                  ),
                  const SizedBox(height: 40),
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
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "tambien puedes contactarnos a traves de:",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icono de WhatsApp
                                  Icon(
                                    Icons.message,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "+123 456 789",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  SizedBox(width: 15),

                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "ejemplo@gmail.com",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
