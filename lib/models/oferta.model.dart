class Oferta {
  String id;
  String nome;
  String descricao;
  String loja;
  double preco;
  String uid;
  String userName;

  Oferta(
      {this.id,
      this.nome,
      this.descricao,
      this.loja,
      this.preco,
      this.uid,
      this.userName});

  Oferta.fromMap(Map<String, dynamic> dados) {
    nome = dados['nome'];
    descricao = dados['descricao'];
    preco = dados['preco'];
    loja = dados['loja'];
    uid = dados['uid'];
    userName = dados['username'];
  }
}
