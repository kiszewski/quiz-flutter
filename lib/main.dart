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
        {'texto': 'Amarelo', 'peso': 10},
        {'texto': 'Azul', 'peso': 10},
        {'texto': 'Verde', 'peso': 10}
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'peso': 10},
        {'texto': 'Cachorro', 'peso': 10},
        {'texto': 'Coelho', 'peso': 10}
      ]
    },
    {
      'pergunta': 'Qual seu time favorito?',
      'respostas': [
        {'texto': 'RealMadrid', 'peso': 10},
        {'texto': 'Chelsea', 'peso': 10},
        {'texto': 'Inter', 'peso': 10}
      ]
    },
    {
      'pergunta': 'Qual sua comida favorito?',
      'respostas': [
        {'texto': 'Batatafrita', 'peso': 10},
        {'texto': 'Arroz', 'peso': 10},
        {'texto': 'Pastel', 'peso': 10}
      ]
    },
    {
      'pergunta': 'Qual seu jogo favorito?',
      'respostas': [
        {'texto': 'Overwatch', 'peso': 10},
        {'texto': 'Fortnite', 'peso': 10},
        {'texto': 'Fifa', 'peso': 10}
      ]
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

  void _restaurarPerguntas() {
    setState(() {
      _perguntaAtual = 0;
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
              : Resultado(),
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
