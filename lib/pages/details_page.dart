// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prjkode/theme/app_bar_widget.dart';
import 'package:prjkode/theme/app_colors.dart';
import '../components/character_card.dart';
import '../data/repository.dart';
import '../models/character_model.dart';
import '../models/detailed_character.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final int characterId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<CharacterModel>? character;

  @override
  void initState() {
    character = Repository().getAllCharacter(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Card(
        color: AppColors.primaryColorLight,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 17, right: 20, left: 20, bottom: 60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: FutureBuilder<DetailedCharacter>(
            future: Repository().getCharacterDetails(widget.characterId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final model = snapshot.data!;
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          model.image,
                          height: 200,
                          width: 372,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "${model.name?.toUpperCase()}",
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(height: 38),
                            Row(
                              children: [
                                Container(
                                  height: 7,
                                  width: 7,
                                  decoration: BoxDecoration(
                                    color: statusColor(model),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${model.status} - ${model.species}",
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Last know location:',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              model.location.name,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'First seen in:',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              model.episode.first,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  Color statusColor(model) {
    switch (model.status?.toLowerCase()) {
      case 'alive':
        return AppColors.green;
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}




// class DetailsPage extends StatefulWidget {
//   static const routeId = '/details';

//   final int model;

//   const DetailsPage({
//     Key? key,
//     required this.model,
//   }) : super(key: key);

//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   Future<CharacterModel>? character;
//   late Size size;

//   @override
//   void initState() {
//     character = Repository.getCharacter();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;

//     return Scaffold(

      
//       backgroundColor: AppColors.backgroundColor,
//       body: FutureBuilder<CharacterModel>(
//         builder: (_, snapshot) {
//       Container(
//         margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//         padding: const EdgeInsets.all(0),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 widget.model.image!,
//                 height: 200,
//                 width: size.width,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       );
      
//     );
//   }
// }
