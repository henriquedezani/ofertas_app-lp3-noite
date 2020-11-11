import 'package:flutter/material.dart';
import 'package:ofertas_app/models/oferta.model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Oferta _oferta = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Oferta"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              "https://via.placeholder.com/300x300.png?text=${_oferta.nome}",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  _oferta.nome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "R\$ ${_oferta.preco}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            _oferta.loja,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30),
            child: SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {},
                starCount: 5,
                rating: 3,
                size: 24.0,
                isReadOnly: false,
                // filledIconData: Icons.blur_off,
                // halfFilledIconData: Icons.blur_on,
                color: Colors.amber,
                borderColor: Colors.amber,
                spacing: 0.0),
          ),
          Text(_oferta.descricao),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
                onPressed: () {},
                child: Text("Ir para loja usando cupom de desconto")),
          )
        ],
      ),
    );
  }
}
