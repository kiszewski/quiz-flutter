import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() cb;

  Resposta(this.texto, this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: RaisedButton(
        elevation: 0,
        color: Colors.blue,

        textColor: Colors.white,
        child: Text(texto, style: TextStyle(fontSize: 35)),
        onPressed: cb,
      ),
    );
  }
}
