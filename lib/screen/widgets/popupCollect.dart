// import 'package:flutter/material.dart';
// import 'package:iskae/models/collecte_model.dart';
// import 'package:iskae/screen/widgets/custum.dart';
// import 'package:iskae/screen/widgets/head.dart';
// import 'package:iskae/services/providers/provider_collecte.dart';
// import 'package:iskae/style/colors.dart';
// import 'package:iskae/style/style.dart';
// import 'package:provider/provider.dart';

// const String heroAddcollecte = 'add-todo-collecte';

// class CollectePopup extends StatefulWidget {
//   final Collecte collecte;

//   CollectePopup({required this.collecte});

//   @override
//   State<CollectePopup> createState() => _CollectePopupState();
// }

// class _CollectePopupState extends State<CollectePopup> {
//   bool horeved = false;
//   bool horeved2 = false;
//   @override
//   Widget build(BuildContext context) {
//     CollecteProvider collecteProvider = Provider.of<CollecteProvider>(context);
//     bool _isLoading = false;
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(100.0),
//         child: Hero(
//           tag: heroAddcollecte,
//           createRectTween: (begin, end) {
//             return CustomRectTween(begin: begin!, end: end!);
//           },
//           child: Material(
//             color: Colors.white,
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     headContent(
//                       title: "Contribution",
//                       subtitle: "Company Contribution Information",
//                       icondata: Icons.money,
//                     ),
//                     const Divider(
//                       color: Colors.white,
//                       thickness: 0.2,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 280),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Icon(
//                             Icons.person,
//                             color: AppColors.gradient1,
//                             size: 40,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: 'Information du Dons/Contribution',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 400, top: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const TextWidget(
//                             text: 'Nom du Donneur :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${widget.collecte.nom_donneur}',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 400, top: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const TextWidget(
//                             text: 'Email du Donneur :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${widget.collecte.email_donneur} ',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 400, top: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const TextWidget(
//                             text: 'Montant donné :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${widget.collecte.montant} ',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 400, top: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const TextWidget(
//                             text: 'Date du don :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${widget.collecte.date_don} ',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 400, top: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const TextWidget(
//                             text: 'Adresse du Donneur :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: TextWidget(
//                               text:
//                                   '${collecteProvider.adresse.rue} ${collecteProvider.adresse.ville} ${collecteProvider.adresse.codePostal}',
//                               fontWeight: FontWeight.bold,
//                               size: 25,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
