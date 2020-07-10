import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questao.dart';
import 'resposta.dart';
import 'resultado.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  static final List<Map<String, dynamic>> _perguntas = [
    {
      'pergunta': 'Qual sua cor favorita?',
      'respostas': ['Amarelo', 'Azul', 'Verde']
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': ['Gato', 'Cachorro', 'Coelho']
    },
    {
      'pergunta': 'Qual seu time favorito?',
      'respostas': ['Real Madrid', 'Chelsea', 'Inter']
    },
    {
      'pergunta': 'Qual sua comida favorito?',
      'respostas': ['Batata frita', 'Arroz', 'Pastel']
    },
    {
      'pergunta': 'Qual seu jogo favorito?',
      'respostas': ['Overwatch', 'Fortnite', 'Fifa']
    },
  ];
  var _perguntaAtual = 0;

  void _responder() {
    print(_perguntaAtual);
    if (existePerguntaSelecionada) {
      setState(() {
        //Qualquer alteração de estado precisa ser feita dentro desse metodo,
        //de forma reativa ele ira atualizar a interface grafica
        _perguntaAtual++;
      });
    }
  }

  bool get existePerguntaSelecionada {
    return _perguntaAtual < _perguntas.length;
  }

  Widget build(BuildContext context) {
    final List<String> respostas = existePerguntaSelecionada
      ? _perguntas[_perguntaAtual]['respostas']
      : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Center(
          child: existePerguntaSelecionada ? Column(children: <Widget>[
            Questao(_perguntas[_perguntaAtual]['pergunta']),
            ...respostas.map((resp) => Resposta(resp, _responder)).toList()
          ]) : Resultado(),
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
