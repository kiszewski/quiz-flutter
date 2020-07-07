import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questao.dart';
import 'resposta.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaAtual = 0;

  void _responder() {
    setState(() {
      //Qualquer alteração de estado precisa ser feita dentro desse metodo,
      //de forma reativa ele ira atualizar a interface grafica
      _perguntaAtual++;
    });
    print(_perguntaAtual);
  }

  Widget build(BuildContext context) {
    final perguntas = [
      'Qual sua cor favorita?',
      'Qual seu animal favorito?',
      'Qual seu time favorito?',
      'Qual sua comida favorito?',
      'Qual seu jogo favorito?'
      ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Questao(perguntas[_perguntaAtual]),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ]),
        ),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
