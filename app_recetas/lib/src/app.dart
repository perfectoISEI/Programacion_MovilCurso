import 'package:app_recetas/src/connection/server_controller.dart';
import 'package:app_recetas/src/screens/home_page.dart';
import 'package:app_recetas/src/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';

ServerController _serverController = ServerController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan[800],
        accentColor: Colors.cyan[300],
      ),
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            // ignore: missing_return
            builder: (BuildContext context) {
          switch (settings.name) {
            case "/":
              return LoginPage(_serverController, context);
            case "/home":
              User userLogged = settings.arguments;
              return HomePage(userLogged);
          }
        });
      },
    );
  }
}
