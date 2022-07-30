import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../pages/details_page.dart';
import '../theme/app_colors.dart';

class CharacterCard extends StatefulWidget {
  final Results model;
  const CharacterCard({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        DetailsPage.routeId,
        arguments: widget.model.id,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.model.image!,
                height: 200,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            text(),
          ],
        ),
      ),
    );
  }

  Widget text() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 50,
        width: size.width * 0.902,
        decoration: const BoxDecoration(
          color: AppColors.primaryColorLight,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  widget.model.name!.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
