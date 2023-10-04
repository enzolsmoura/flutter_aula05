import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_aula05/pages/second_page.dart';
import 'package:flutter_aula05/widgets/botao_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      BotaoWidget(
          texto: "Mudar de Página",
          funcao: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondPage()));
          }),
      BotaoWidget(
          texto: "Requisição Pokémon",
          funcao: () async {
            int num = Random().nextInt(1017);
            var url = Uri.parse("https://pokeapi.co/api/v2/pokemon/${num}");
            var response = await http.get(url);
            var data = jsonDecode(response.body);
            String name = data["species"]["name"];
            String type = data["types"][0]["type"]["name"];
          }),
    ])));
  }
}
