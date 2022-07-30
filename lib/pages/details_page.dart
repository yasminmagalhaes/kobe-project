// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prjkode/theme/app_bar_widget.dart';
import 'package:prjkode/theme/app_colors.dart';
import '../components/character_card.dart';
import '../data/repository.dart';
import '../models/character_model.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  DetailsPage({
    Key? key,
    required int characterId,
  }) : super(key: key);

  late Results model;

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
    // final date = DateTime.parse(model.created!);

    // final locationName =
    //     model.location!.map((location) => location.name);
    // final allCompanies =
    //     locationName.reduce((value, element) => value + ', ' + element);

    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.model.image!,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.model.name?.toUpperCase()}",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 15),
                // Wrap(
                //   spacing: 10,
                //   runSpacing: 10,
                //   children: detailedPage.model.!
                //       .map(
                //         (genre) => Chip(
                //           backgroundColor: AppColors.primaryColorLight,
                //           labelStyle: TextStyle(color: AppColors.white),
                //           side: BorderSide(color: AppColors.white),
                //           label: Text(genre.name),
                //         ),
                //       )
                //       .toList(),
                // ),
                const SizedBox(height: 15),
                Text(
                  widget.model.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Production Companies:',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                // Text(
                //   allCompanies,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 12.5,
                //     color: AppColors.white,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
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
//       appBar: AppBarWidget(
//         leftIcon: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: AppColors.white,
//           ),
//         ),
//       ),
      
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
