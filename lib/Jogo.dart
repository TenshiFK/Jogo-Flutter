import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo!";

  final Map<String, AssetImage> _opcoesImagens = {
    "pedra": AssetImage("assets/pedra.png");
    "papel": AssetImage("assets/papel.png");
    "tesoura": AssetImage("assets/tesoura.png");
  };

  void _opcaoSelecionada(String escolhaUsuario){
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3); //gerando num aleatório entre 0 e 2
    var escolhaApp = opcoes[numero];

    print("Escolha do app: " + escolhaApp);
    print("Escolha do usuário: "+ escolhaUsuario);


    setState(() {
      this._imagemApp = _opcoesImagens[escolhaApp]!;
    });

    //regra do jogo
    if((escolhaUsuario == "pedra" && escolhaApp == "tesoura")||(escolhaUsuario == "tesoura" && escolhaApp == "papel")||(escolhaUsuario == "papel" && escolhaApp == "pedra")){
      setState(() {
        this._mensagem = "Parabéns, você ganhou!";
      });
    } else if((escolhaUsuario == "tesoura" && escolhaApp == "pedra")||(escolhaUsuario == "papel" && escolhaApp == "tesoura")||(escolhaUsuario == "pedra" && escolhaApp == "papel")){
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    } else{
      setState(() {
        this._mensagem = "Empate!";
      });
    }
  }
}
