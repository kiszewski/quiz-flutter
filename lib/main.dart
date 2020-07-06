import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(PerguntasApp());

class PerguntasState extends State<PerguntasApp> {
  final perguntas = ['Qual sua cor favorita?', 'Qual seu animal favorito?'];

  var perguntaAtual = 0;

  void responder() {
    setState(() {
      //Qualquer alteração de estado precisa ser feita dentro desse metodo, 
      //de forma reativa ele ira atualizar a interface grafica
      perguntaAtual++;  
    });
    print(perguntaAtual);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text(perguntas[perguntaAtual]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder, //passando a função como parametro, não a chamada dessa função
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ]),
        ),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  PerguntasState createState() {
    return PerguntasState();
  }
}
