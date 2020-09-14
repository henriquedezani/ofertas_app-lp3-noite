import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: RaisedButton(
        child: Text("Ir para Home Page"),
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
      ),
    );
  }
}
