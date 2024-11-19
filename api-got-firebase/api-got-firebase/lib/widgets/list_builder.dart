import 'package:api_rick_morty/widgets/lista_characters.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';
import '../services/character_service.dart';

class ListBuilder extends StatefulWidget{

  final String filter;
  const ListBuilder({required this.filter});
  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {

  late Future<List<Character>> listaFuture;
  late List<Character> lista = List.empty();
  late List<Character> listaFiltrados = List.empty();

  @override
  void initState() {
    super.initState();
    var service = CharacterService();
    listaFuture = service.getCharacters();
  }

  @override
  void didUpdateWidget(covariant ListBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget.filter != widget.filter){
      listaFiltrados = lista
          .where((cadaItem) =>
          cadaItem.fullName.toLowerCase().contains(widget.filter.toLowerCase()))
          .toList();
      // Atualize o estado quando o filtro mudar
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: listaFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (lista.isEmpty) {
            lista = snapshot.data ?? List.empty();
            listaFiltrados = lista; // Inicialize a lista filtrada com todos os itens
          }

          // Exiba a lista filtrada
          return Expanded(
            child: ListaCharacters(lista: listaFiltrados),
          );
        }

        if (snapshot.hasError) {
          debugPrint(snapshot.error.toString());
          return Text("Error");
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}


