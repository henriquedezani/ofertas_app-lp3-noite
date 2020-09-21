import 'package:flutter/material.dart';
import 'package:ofertas_app/home.page.dart';
import 'package:ofertas_app/login.page.dart';
import 'package:ofertas_app/cadastro.page.dart';

void main() {
  MyApp app = new MyApp(); // criar um objeto da classe.
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/cadastro': (context) => CadastroPage(),
      },
      initialRoute: '/',
    );
  }
}
