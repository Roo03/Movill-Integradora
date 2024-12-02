import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil_integradora/pages/controllers.dart';
import 'package:movil_integradora/widgets/custom_buttom.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  bool _isNotificationEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationPreference();
    _initializeNotifications();
  }

  Future<void> _loadNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationEnabled = prefs.getBool('notifications_enabled') ?? false;
    });
  }

  Future<void> _saveNotificationPreference(bool enabled) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('notifications_enabled', enabled);
}


  Future<void> _initializeNotifications() async {
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );

    
    await _localNotificationsPlugin.initialize(initializationSettings);

    
    final bool? result = await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Simular permisos en Android (para completar lógicamente)
    setState(() {
      _isNotificationEnabled = result ?? true;
    });
  await _saveNotificationPreference(true);
    // Crear el canal de notificaciones en Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id',
      'channel_name',
      description: 'Este es el canal de notificaciones predeterminado',
      importance: Importance.max,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  void _rejectNotifications() async {
    setState(() {
      _isNotificationEnabled = false;
    });
    await _saveNotificationPreference(false);
  }

  void _showLocalNotification({required String title, required String body}) {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    _localNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  void _sendWelcomeNotification() {
    if (_isNotificationEnabled) {
      _showLocalNotification(
        title: "Bienvenido a la app ",
        body: "Gracias por activar las notificaciones.",
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          content:  Text('Por favor, habilita las notificaciones.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Mostrar el cuadro de diálogo para habilitar notificaciones
  Future<void> _showNotificationDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Habilitar Notificaciones'),
          content: const Text('¿Deseas habilitar las notificaciones?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Rechazar'),
              onPressed: () {
                _rejectNotifications();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Controller(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () async {
                await _initializeNotifications();
                _sendWelcomeNotification();
                await _saveNotificationPreference(true); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Controller(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 44, 63),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/img/Cenote 2.jpg"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
            ],
          ),
          color: Colors.black.withOpacity(0.5),
          backgroundBlendMode: BlendMode.darken,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
              ),
              child: Text(
                "Bienvenidos",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Column(
                children: [
                  ButtomCustom(
                    icon: Icons.arrow_forward_ios,
                    color: const Color(0xFFFF5733),
                    iconVisible: true,
                    text: "Comenzar",
                    textColor: Colors.white,
                    onPressed: () {
                      _showNotificationDialog(); 
                    },
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
