import 'package:prjkode/data/character_controller.dart';
import 'package:prjkode/models/character_model.dart';
import 'package:prjkode/theme/app_bar_widget.dart';
import 'package:prjkode/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../components/character_card.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late CharacterController controller;

  @override
  void initState() {
    controller = CharacterController();
    controller.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leftIcon: Icon(
          Icons.menu,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.black,
      body: ValueListenableBuilder<List<Results>>(
        valueListenable: controller.characterNotifier,
        builder: (_, characters, child) {
          if (characters.isNotEmpty) {
            return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  controller.setIndex(index);
                  return CharacterCard(model: characters[index]);
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
