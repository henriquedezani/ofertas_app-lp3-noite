import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance; // singleton

  String email;
  String senha;

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width; // largura da tela.
    return Scaffold(
      key: _scaffoldKey,
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
                    onSaved: (value) => email = value,
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
                    onSaved: (value) => senha = value,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            var result = await _auth.signInWithEmailAndPassword(
                                email: email, password: senha);
                            if (result != null) {
                              print(result.user.uid);
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            }
                          } on FirebaseAuthException catch (ex) {
                            final snackbar = SnackBar(
                              content: Text(ex.message),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 10),
                            );
                            _scaffoldKey.currentState.showSnackBar(
                              snackbar,
                            );
                          }
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text("Novo Usuário"),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/registro');
                        },
                      ),
                      FlatButton(
                        child: Text("Esqueci a senha"),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/esqueceusenha');
                        },
                      ),
                    ],
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
