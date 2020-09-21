import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>(); // ~ id

  String validaCampo(String texto) {
    if (texto.isEmpty)
      return "Campo obrigatório";
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Oferta"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  // TODO: Salvar os dados no banco.
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
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                    ),
                    maxLines: 5,
                    minLines: 3,
                    validator: validaCampo,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome da Loja',
                    ),
                    validator: validaCampo,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço',
                    ),
                    validator: validaCampo,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cupom de desconto',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
