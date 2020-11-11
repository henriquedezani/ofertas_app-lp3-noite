import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>(); // ~ id
  var _database = FirebaseFirestore.instance;
  var _auth = FirebaseAuth.instance; // singleton

  String validaCampo(String texto) {
    if (texto.isEmpty)
      return "Campo obrigatório";
    else
      return null;
  }

  String nome;
  String descricao;
  String loja;
  double preco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Oferta"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  await _database.collection('ofertas').add({
                    "nome": nome,
                    "descricao": descricao,
                    "loja": loja,
                    "preco": preco,
                    "uid": _auth.currentUser.uid,
                    "username": _auth.currentUser.displayName
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.network(
                      'https://via.placeholder.com/200x200.png?text=Produto1'),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome do Produto',
                    ),
                    validator: validaCampo,
                    onSaved: (value) => nome = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                    ),
                    maxLines: 5,
                    minLines: 3,
                    validator: validaCampo,
                    onSaved: (value) => descricao = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome da Loja',
                    ),
                    validator: validaCampo,
                    onSaved: (value) => loja = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço',
                    ),
                    validator: validaCampo,
                    onSaved: (value) => preco = double.tryParse(value) ?? 0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
