import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas_app/models/oferta.model.dart';

class HomePage extends StatelessWidget {
  final database = FirebaseFirestore.instance; // singleton

  // database.collection('ofertas').snapshots() -> Stream (realtime) -> StreamBuilder
  // database.collection('ofertas').get() -> Future (única vez) ~ SELECT -> FutureBuilder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: database.collection('ofertas').snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var documents = snapshot.data.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (_, index) {
              var dados = documents[index].data();
              return OfertaItem(Oferta.fromMap(documents[index].id, dados),
                  ref: documents[index].reference);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro');
        },
      ),
    );
  }
}

class OfertaItem extends StatelessWidget {
  var _auth = FirebaseAuth.instance;

  // atributo da classe:
  final Oferta oferta;
  DocumentReference ref;

  // construtor da classe:
  OfertaItem(this.oferta, {this.ref});

  // método:
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detalhe', arguments: oferta);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://via.placeholder.com/100x100.png?text=Produto1'),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          child: Text(
                            oferta.nome,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "R\$ ${oferta.preco}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    oferta.descricao,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(oferta.loja),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://imagens.canaltech.com.br/celebridades/78.400.jpg'),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(child: Text(oferta.userName)),
                      _auth.currentUser.uid == oferta.uid
                          ? IconButton(
                              icon: Icon(Icons.delete,
                                  color: Colors.red, size: 18),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text("Confirma a exclusão?"),
                                    content: Text(
                                        "Os dados apagados não podem ser recuperados."),
                                    actions: [
                                      FlatButton(
                                          child: Text("Cancelar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                      RaisedButton(
                                        color: Colors.red,
                                        child: Text("Confirmar",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          ref.delete();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Container(),
                      _auth.currentUser.uid == oferta.uid
                          ? IconButton(
                              icon: Icon(Icons.edit,
                                  color: Colors.blue, size: 18),
                              onPressed: () {
                                //TODO: Implementar a Edição da Oferta (1 ponto na média)
                              })
                          : Container(),
                    ],
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

// JSON (JavaScript Object Notation)
// {
//   "nome": "Henrique",
//   "idade": 39,
//   "endereco": "Rua xyz.."
// }

// Map<String, dynamic> = DocumentSnapShot
