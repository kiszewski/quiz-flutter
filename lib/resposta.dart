import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() cb;

  Resposta(this.texto, this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.blue[400],
        textColor: Colors.white,
        padding: EdgeInsets.all(40),
        child: Text(texto, style: TextStyle(fontSize: 20)),
        onPressed: cb,
      ),
    );
  }
}