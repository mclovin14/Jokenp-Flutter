import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra", "papel", "tesoura"];
      var numero = Random().nextInt(opcoes.length);
      var escolhaApp = opcoes[numero];

      switch(escolhaApp){
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("images/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("images/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("images/tesoura.png");
          });
          break;
      }

      if(
          (escolhaUsuario == "papel" && escolhaApp == "pedra")   ||
          (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel")
      ){
        setState(() {
          _mensagem = "Você ganhou! :)";
        });

      }else if(
          (escolhaApp == "papel" && escolhaUsuario == "pedra")   ||
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel")
      ){
        setState(() {
          _mensagem = "Você perdeu! :(";
        });

      }else{
        setState(() {
          _mensagem = "Empatou!";
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPô"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          /*  GestureDetector(// usada para detetectar se algum widget foi tocado na tela
            onTap: (){print("imagem");} ,
            child: Image.asset("images/padrao.png"),
          ),*/
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                    "images/pedra.png",
                    fit: BoxFit.contain,
                    height: 100
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                    "images/papel.png",
                    fit: BoxFit.contain,
                    height: 100
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                    "images/tesoura.png",
                    fit: BoxFit.contain,
                    height: 100
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
