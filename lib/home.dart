import 'dart:async';

import 'package:app_novo/lista_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_novo/models/repository.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Future<All> fetchRepos() async {
//   if (response.statusCode == 200) {
//     print(response.body);
//     return All.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Falha ao recuperar');
//   }
// }

class _HomeState extends State<Home> {
  var _repositorios = <Repository>[];

  Future<void> searchRepositories() async {
    final response =
        await http.get(Uri.parse('http://api.github.com/users/NSuzano/repos'));
    var data = jsonDecode(response.body);
    debugPrint("DATA: $data");
    setState(() {
      _repositorios =
          (data as List).map((e) => Repository.fromJson(e)).toList();
      _repositorios.forEach((elements) {
        print(elements.name);
      });
      print(_repositorios);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GitHubApi'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Text("BOTAO"),
                  ElevatedButton(
                      onPressed: searchRepositories, child: Text("TESTE")),
                  Expanded(child: ListRepository(repositories: _repositorios))
                ],
              ),
            ),
          ),
        ));
  }
}
