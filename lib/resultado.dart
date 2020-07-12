import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int _pontuacaoFinal;

  Resultado(this._pontuacaoFinal);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Parabéns!', style: TextStyle(fontSize: 35, )),
      Text('Nota final: $_pontuacaoFinal/50', style: TextStyle(fontSize: 30))
    ]);
  }
}
