import 'package:prjkode/models/character_model.dart';
import 'package:prjkode/models/detailed_character.dart';
import 'package:dio/dio.dart';

class Repository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      queryParameters: {
        'characters': "https://rickandmortyapi.com/api/character",
        'locations': "https://rickandmortyapi.com/api/location",
        'episodes': "https://rickandmortyapi.com/api/episode",
      },
    ),
  );

  Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    final response = await _dio.get('/character/$characterId');

    final data = DetailedCharacter.fromJson(response.data);

    return data;
  }

  Future<CharacterModel> getAllCharacter(int page) async {
    var response =
        await _dio.get('/character', queryParameters: {'page': page});

    final data = CharacterModel.fromJson(response.data);

    return data;
  }
}
