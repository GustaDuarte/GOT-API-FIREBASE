import 'package:flutter/material.dart';

import '../models/character.dart';

class ListaCharacters extends StatelessWidget {
  final List<Character> lista;
  const ListaCharacters({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(lista[index].fullName),
              leading: Image.network(
                  lista[index].imageUrl),
            );
          },
          separatorBuilder: (context, int) {
            return Divider();
          },
          itemCount: lista.length),
    );
  }
}
