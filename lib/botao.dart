import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final cb;

  Botao(this.texto, this.cb);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(texto),
      onPressed: cb,
    );
  }
}
