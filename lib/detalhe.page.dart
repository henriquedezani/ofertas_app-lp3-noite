import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              "https://i.pinimg.com/236x/ea/6c/99/ea6c993e281a8742f856652ca16024dd.jpg",
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
                  "Computador Dell Vostro 1400 16GB RAM 1TB SSD",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "R\$ 100,00",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Loja do Produto",
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
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
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
