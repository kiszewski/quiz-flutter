import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(PerguntasApp());


class PerguntasApp extends StatelessWidget {
  final perguntas = [
    'Qual sua cor favorita?',
    'Qual seu animal favorito?'
  ];

  var perguntaAtual = 0;

  void responder() {
    perguntaAtual++;
    print(perguntaAtual);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
            Text(perguntas[0]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,), //passando a função como parametro, não a chamada dessa função
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,),
          ]),
        ),
      ),
    );
  }
}