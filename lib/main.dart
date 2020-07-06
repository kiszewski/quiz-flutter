import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final perguntas = ['Qual sua cor favorita?', 'Qual seu animal favorito?'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text(perguntas[_perguntaAtual]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder, //passando a função como parametro, não a chamada dessa função
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
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
