import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final String _pergunta;
  final List<Map<String, Object>> _respostas;
  final void Function(int) _responder;

  Questionario({pergunta, respostas, responder})
      : _pergunta = pergunta,
        _respostas = respostas,
        _responder = responder;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Questao(_pergunta),
      ..._respostas.map((resp) {
        return Resposta(
          resp['texto'],
          () => _responder(resp['pontuacao']));
      }).toList()
    ]);
  }
}
