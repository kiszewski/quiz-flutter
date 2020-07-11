import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  static final List<Map<String, dynamic>> _perguntas = [
    {
      'pergunta': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Amarelo', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 1}
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 8},
        {'texto': 'Cachorro', 'pontuacao': 7},
        {'texto': 'Coelho', 'pontuacao': 2}
      ]
    },
    {
      'pergunta': 'Qual seu time favorito?',
      'respostas': [
        {'texto': 'Real Madrid', 'pontuacao': 5},
        {'texto': 'Chelsea', 'pontuacao': 3},
        {'texto': 'Inter', 'pontuacao': 7}
      ]
    },
    {
      'pergunta': 'Qual sua comida favorito?',
      'respostas': [
        {'texto': 'Batata frita', 'pontuacao': 8},
        {'texto': 'Arroz', 'pontuacao': 2},
        {'texto': 'Pastel', 'pontuacao': 5}
      ]
    },
    {
      'pergunta': 'Qual seu jogo favorito?',
      'respostas': [
        {'texto': 'Overwatch', 'pontuacao': 6},
        {'texto': 'Fortnite', 'pontuacao': 9},
        {'texto': 'Fifa', 'pontuacao': 8}
      ]
    },
  ];
  var _perguntaAtual = 0;
  var _pontuacaoAtual = 0;

  void _responder(int pontuacao) {
    if (existePerguntaSelecionada) {
      setState(() {
        //Qualquer alteração de estado precisa ser feita dentro desse metodo,
        //de forma reativa ele ira atualizar a interface grafica
        _perguntaAtual++;
        _pontuacaoAtual += pontuacao;
        print(_pontuacaoAtual);
      });
    }
  }

  void _restaurarPerguntas() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacaoAtual = 0;
    });
  }

  bool get existePerguntaSelecionada {
    return _perguntaAtual < _perguntas.length;
  }

  Widget build(BuildContext context) {
    final List<Map<String, Object>> respostas = existePerguntaSelecionada
        ? _perguntas[_perguntaAtual]['respostas']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          actions: existePerguntaSelecionada
              ? null
              : <Widget>[
                  RaisedButton(
                      child: Icon(Icons.restore),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: _restaurarPerguntas)
                ],
        ),
        body: Center(
          child: existePerguntaSelecionada
              ? Questionario(
                  pergunta: _perguntas[_perguntaAtual]['pergunta'],
                  respostas: respostas,
                  responder: _responder)
              : Resultado(_pontuacaoAtual),
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
