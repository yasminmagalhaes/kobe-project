import 'package:flutter/material.dart';
import 'package:prjkode/data/repository.dart';

import '../models/character_model.dart';

class CharacterController {
  final ValueNotifier<List<Results>> characterNotifier =
      ValueNotifier<List<Results>>(<Results>[]);
  final Repository characterRepository = Repository();
  final charactersList = <Results>[];
  int actualPage = 1;
  bool isLoading = false;
  int actualIndex = 0;
  getCharacters() async {
    isLoading = true;
    final response = await characterRepository.getAllCharacter(actualPage);
    if (response.results != null) {
      charactersList.addAll(response.results!);
      characterNotifier.value = List.from(charactersList);
      actualPage++;
    }
    isLoading = false;
  }

  setIndex(int index) async {
    actualIndex = index;
    if (charactersList.length - 1 == actualIndex && !isLoading) {
      await getCharacters();
    }
  }
}
