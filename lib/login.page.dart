import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width; // largura da tela.
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: largura > 600 ? 400 : largura,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: Image.asset('assets/images/fatec.png'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail institucional.",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "A senha deve conter 6 caracteres.",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.security),
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    obscureText: true,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          Navigator.of(context).pushReplacementNamed('/home');
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text("Não tem cadastro? Clique aqui."),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("ou, faça login pelas redes sociais."),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RaisedButton(
                        color: Colors.red[400],
                        child: Text(
                          "Google",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: Colors.blue[800],
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
