import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
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
            Text("Nome do Produto"),
          ],
        ),
      ),
    );
  }
}
