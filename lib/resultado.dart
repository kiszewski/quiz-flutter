import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int _pontuacaoFinal;

  Resultado(this._pontuacaoFinal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Parabéns, nota: $_pontuacaoFinal',
        style: TextStyle(
          fontSize: 35
        ))
    );
  }
}