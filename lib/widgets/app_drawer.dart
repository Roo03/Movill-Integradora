import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(
            FeatherIcons.search,
            color: Colors.white,
          ),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/FondoDrawer.jpg"),
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
                color: Colors.black.withOpacity(1.0),
                backgroundBlendMode: BlendMode.darken,
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
                    child: Text(
                      "AquaClear",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Manual"),
            ),
            const ListTile(
              leading: Icon(Icons.control_camera),
              title: Text("Controlladores"),
            ),
            const ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Soporte"),
            ),
          ],
        ),
      ),
    );
  }
}