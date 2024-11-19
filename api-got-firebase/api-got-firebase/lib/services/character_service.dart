import 'dart:convert';

import 'package:api_rick_morty/models/character.dart';
import 'package:http/http.dart' as http;


  class CharacterService {

  Future<List<Character>> getCharacters() async {
  final response = await http.get(Uri.parse("https://thronesapi.com/api/v2/Characters"));

  if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Character.fromJson(item)).toList();
      } else {
      throw  Exception("Erro ao buscar os personagens");
      }
    }
  }