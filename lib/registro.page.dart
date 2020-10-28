import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance; // singleton

  String email;
  String nome;
  String senha;

  Future registraUsuario(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (await criaUsuarioNoFirebase())
        Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  Future<bool> criaUsuarioNoFirebase() async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      await result.user.updateProfile(displayName: nome);
      return true;
    } on FirebaseAuthException catch (ex) {
      exibeSnackBarComMensagemErro(ex.message);
      return false;
    }
  }

  void exibeSnackBarComMensagemErro(String erro) {
    final snackbar = SnackBar(
      content: Text(erro),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
    );
    _scaffoldKey.currentState.showSnackBar(
      snackbar,
    );
  }

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
                      labelText: "Nome",
                      hintText: "Digite seu nome completo.",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    onSaved: (value) => nome = value,
                  ),
                  SizedBox(height: 10),
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
                        "Registrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => registraUsuario(context),
                    ),
                  ),
                  FlatButton(
                    child: Text("Já tem cadastro? Faça o login."),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
