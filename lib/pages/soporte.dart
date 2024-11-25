import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para TextInputFormatter
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movil_integradora/pages/controllers.dart';
import 'package:movil_integradora/pages/acerca_de.dart';
import 'package:movil_integradora/pages/manual.dart';

class Soporte extends StatefulWidget {
  const Soporte({super.key});

  @override
  State<Soporte> createState() => _SoporteState();
}

class _SoporteState extends State<Soporte> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _asuntoController = TextEditingController();
  final _mensajeController = TextEditingController();

  String? _validarNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su nombre';
    } else if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value)) {
      return 'Solo se permiten letras';
    }
    return null;
  }

  // Expresión regular de correo electrónico corregida
  String? _validarCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Por favor ingrese un correo válido';
    }
    return null;
  }

  // Validación del teléfono que permite solo 10 dígitos
  String? _validarTelefono(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su número de teléfono';
    } else if (value.length != 10) {
      return 'El número debe contener 10 dígitos';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 30, 44, 63),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  MaterialPageRoute(builder: (context) => const Controller()),
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
                  MaterialPageRoute(builder: (context) => const Soporte()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Acerca de"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Acercade()),
                );
              },
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
                      Colors.black
                          .withOpacity(0.5),
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
                          labelStyle: TextStyle(
                              color: Colors.white), // Color de las etiquetas
                          hintStyle: TextStyle(
                              color: Colors
                                  .white), // Color del texto de sugerencia
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white), // Borde blanco
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Borde blanco cuando está habilitado
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Borde blanco cuando está enfocado
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre',
                            ),
                            validator: _validarNombre,
                            style: const TextStyle(
                                color:
                                    Colors.white), // Texto ingresado en blanco
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _correoController,
                            decoration: const InputDecoration(
                              labelText: 'Correo Electrónico',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _validarCorreo,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _telefonoController,
                            decoration: const InputDecoration(
                              labelText: 'Número de Teléfono',
                            ),
                            keyboardType: TextInputType.number,
                            validator: _validarTelefono,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _asuntoController,
                            decoration: const InputDecoration(
                              labelText: 'Asunto',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese un asunto';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _mensajeController,
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
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Formulario Enviado')),
                                  );
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
