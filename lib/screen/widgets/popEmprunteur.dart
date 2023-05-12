// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iskae/models/emprunt_model.dart';
// import 'package:iskae/models/emprunteur_model.dart';
// import 'package:iskae/models/preteur_model.dart';
// import 'package:iskae/screen/widgets/custum.dart';
// import 'package:iskae/screen/widgets/delayedAnimation.dart';
// import 'package:iskae/screen/widgets/snackbarwidget.dart';
// import 'package:iskae/services/providers/provider_collecte.dart';
// import 'package:iskae/style/colors.dart';
// import 'package:iskae/style/style.dart';
// import 'package:provider/provider.dart';
// import 'package:iskae/screen/widgets/head.dart';

// const String heroAddemprunteur = 'add-todo-emprunteur';

// class AddEmprunteurPopup extends StatefulWidget {
//   AddEmprunteurPopup();

//   @override
//   State<AddEmprunteurPopup> createState() => _AddEmprunteurPopupState();
// }

// class _AddEmprunteurPopupState extends State<AddEmprunteurPopup> {
//   @override
//   Widget build(BuildContext context) {
//     CollecteProvider collecteProvider = Provider.of<CollecteProvider>(context);
//     List<String> types = ['entreprise', 'other', 'professionnel'];
//     final nom = TextEditingController();
//     String type = 'entreprise';
//     final identifiant = TextEditingController();
//     bool isloading = false;
//     final _formKey = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(50.0),
//         child: Hero(
//           tag: heroAddemprunteur,
//           createRectTween: (begin, end) {
//             return CustomRectTween(begin: begin!, end: end!);
//           },
//           child: StatefulBuilder(builder: (context, set) {
//             return AlertDialog(
//               backgroundColor: Colors.white,
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               content: SingleChildScrollView(
//                 padding: const EdgeInsets.all(
//                   30,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: const Icon(
//                               Icons.add_business,
//                               color: AppColors.gradient1,
//                               size: 60,
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 20),
//                             child: const TextWidget(
//                               text: 'Ajouter un Emprunteur',
//                               color: AppColors.black,
//                               size: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           DelayedAnimation(
//                             delay: 100,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   labelText: "Types",
//                                   labelStyle: GoogleFonts.poppins(
//                                       color: AppColors.black),
//                                   prefixIcon: Icon(
//                                     Icons.type_specimen,
//                                     color: AppColors.gradient1,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: AppColors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 value: type,
//                                 icon: const Icon(
//                                   Icons.arrow_drop_down_circle,
//                                   color: AppColors.gradient1,
//                                 ),
//                                 dropdownColor: AppColors.gradient1,
//                                 style: GoogleFonts.poppins(),
//                                 iconSize: 20,
//                                 items: types.map((e) {
//                                   return DropdownMenuItem(
//                                     value: e,
//                                     child: TextWidget(
//                                       text: e,
//                                       color: AppColors.black,
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   set(() {
//                                     type = value!;
//                                   });
//                                   print(type);
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 150,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 controller: nom,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Nom de l\'empreteur',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.file_open,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer le nom ';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 250,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 controller: identifiant,
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Identifiant',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.note_outlined,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer l\identifiant';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.gradient1,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                   15,
//                                 ),
//                               ),
//                               elevation: 5,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 60,
//                                 vertical: 20,
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: isloading
//                                 ? const CircularProgressIndicator(
//                                     color: AppColors.white,
//                                     strokeWidth: 1,
//                                   )
//                                 : TextWidget(
//                                     text: 'Add',
//                                     color: AppColors.white,
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// const String heroaddpreteur = 'add-todo-preteur';

// class AddPreteurPopup extends StatefulWidget {
//   AddPreteurPopup();

//   @override
//   State<AddPreteurPopup> createState() => _AddPreteurPopupState();
// }

// class _AddPreteurPopupState extends State<AddPreteurPopup> {
//   @override
//   Widget build(BuildContext context) {
//     CollecteProvider collecteProvider = Provider.of<CollecteProvider>(context);
//     List<String> types = ['entreprise', 'other', 'professionnel'];
//     final nom = TextEditingController();
//     String type = 'entreprise';
//     final identifiant = TextEditingController();
//     bool isloading = false;
//     final _formKey1 = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(50.0),
//         child: Hero(
//           tag: heroAddemprunteur,
//           createRectTween: (begin, end) {
//             return CustomRectTween(begin: begin!, end: end!);
//           },
//           child: StatefulBuilder(builder: (context, set) {
//             return AlertDialog(
//               backgroundColor: Colors.white,
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               content: SingleChildScrollView(
//                 padding: const EdgeInsets.all(
//                   30,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: const Icon(
//                               Icons.person_add_sharp,
//                               color: AppColors.gradient1,
//                               size: 60,
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 20),
//                             child: const TextWidget(
//                               text: 'Ajouter un Preteur',
//                               color: AppColors.black,
//                               size: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Form(
//                       key: _formKey1,
//                       child: Column(
//                         children: [
//                           DelayedAnimation(
//                             delay: 100,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   labelText: "Types",
//                                   labelStyle: GoogleFonts.poppins(
//                                       color: AppColors.black),
//                                   prefixIcon: Icon(
//                                     Icons.type_specimen,
//                                     color: AppColors.gradient1,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: AppColors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 value: type,
//                                 icon: const Icon(
//                                   Icons.arrow_drop_down_circle,
//                                   color: AppColors.gradient1,
//                                 ),
//                                 dropdownColor: AppColors.gradient1,
//                                 style: GoogleFonts.poppins(),
//                                 iconSize: 20,
//                                 items: types.map((e) {
//                                   return DropdownMenuItem(
//                                     value: e,
//                                     child: TextWidget(
//                                       text: e,
//                                       color: AppColors.black,
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   set(() {
//                                     type = value!;
//                                   });
//                                   print(type);
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 150,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 controller: nom,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Nom du preteur',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.no_meals,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer le nom ';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 250,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 controller: identifiant,
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Identifiant du preteur',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.file_open,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer l\identifiant';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.gradient1,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                   15,
//                                 ),
//                               ),
//                               elevation: 5,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 60,
//                                 vertical: 20,
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: isloading
//                                 ? const CircularProgressIndicator(
//                                     color: AppColors.white,
//                                     strokeWidth: 1,
//                                   )
//                                 : TextWidget(
//                                     text: 'Add',
//                                     color: AppColors.white,
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// const String heroaddemprunt = 'add-todo-eprunt';

// class AddEmpruntPopup extends StatefulWidget {
//   final List<Preteur> preteurs;
//   final List<Emprunteur> emprunteurs;
//   AddEmpruntPopup({required this.preteurs, required this.emprunteurs});

//   @override
//   State<AddEmpruntPopup> createState() => _AddEmpruntPopupState();
// }

// class _AddEmpruntPopupState extends State<AddEmpruntPopup> {
//   Preteur? preteur;
//   Emprunteur? emprunteur;
//   bool _isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollecteProvider collecteProvider = Provider.of<CollecteProvider>(context);
//     final date = TextEditingController();
//     final montant = TextEditingController();
//     final motif = TextEditingController();

//     final _formKey = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(50.0),
//         child: Hero(
//           tag: heroaddemprunt,
//           createRectTween: (begin, end) {
//             return CustomRectTween(begin: begin!, end: end!);
//           },
//           child: StatefulBuilder(builder: (context, set) {
//             return AlertDialog(
//               backgroundColor: Colors.white,
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               content: SingleChildScrollView(
//                 padding: const EdgeInsets.all(
//                   30,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: const Icon(
//                               Icons.add_business,
//                               color: AppColors.gradient1,
//                               size: 60,
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 20),
//                             child: const TextWidget(
//                               text: 'Ajouter un Emprunt',
//                               color: AppColors.black,
//                               size: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           DelayedAnimation(
//                             delay: 150,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 controller: montant,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Montant',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.timelapse,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer la durée ';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 250,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: date,
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Date',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.money,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer le montant';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 350,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.gradient1,
//                                 ),
//                                 maxLength: 10,
//                                 maxLines: 3,
//                                 controller: motif,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(27),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.textBorderColor,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: AppColors.gradient1,
//                                       width: 3,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: '',
//                                   label: TextWidget(
//                                     text: 'Motifs',
//                                     color: AppColors.black,
//                                   ),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Icon(
//                                       Icons.description,
//                                       color: AppColors.gradient1,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Entrer le motifs';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 200,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   labelText: "Preteur",
//                                   labelStyle: GoogleFonts.poppins(
//                                       color: AppColors.black),
//                                   prefixIcon: Icon(
//                                     Icons.numbers,
//                                     color: AppColors.gradient1,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: AppColors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 value: preteur,
//                                 icon: const Icon(
//                                   Icons.arrow_drop_down_circle,
//                                   color: AppColors.gradient1,
//                                 ),
//                                 dropdownColor: AppColors.white,
//                                 style: GoogleFonts.poppins(),
//                                 iconSize: 20,
//                                 items: widget.preteurs.map((e) {
//                                   return DropdownMenuItem(
//                                     value: e,
//                                     child: TextWidget(
//                                       text: '${e.name}',
//                                       color: AppColors.black,
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   set(() {
//                                     preteur = value as Preteur;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           DelayedAnimation(
//                             delay: 200,
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxWidth: 350,
//                               ),
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   labelText: "Emprunteur",
//                                   labelStyle: GoogleFonts.poppins(
//                                       color: AppColors.black),
//                                   prefixIcon: Icon(
//                                     Icons.numbers,
//                                     color: AppColors.gradient1,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: AppColors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 value: emprunteur,
//                                 icon: const Icon(
//                                   Icons.arrow_drop_down_circle,
//                                   color: AppColors.gradient1,
//                                 ),
//                                 dropdownColor: AppColors.white,
//                                 style: GoogleFonts.poppins(),
//                                 iconSize: 20,
//                                 items: widget.emprunteurs.map((e) {
//                                   return DropdownMenuItem(
//                                     value: e,
//                                     child: TextWidget(
//                                       text: '${e.name}',
//                                       color: AppColors.black,
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   set(() {
//                                     emprunteur = value as Emprunteur;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.gradient1,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                   15,
//                                 ),
//                               ),
//                               elevation: 5,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 60,
//                                 vertical: 20,
//                               ),
//                             ),
//                             onPressed: () {
//                               Emprunt emprunt = Emprunt(
//                                 date: date.text,
//                                 montant: '${montant.text}.0',
//                                 statut: false,
//                                 emprunteurId:
//                                     emprunteur!.idEmprunteur.toString(),
//                                 preteurId: preteur!.idPreteur.toString(),
//                                 createdAt: DateTime.now().toString(),
//                               );

//                               final form = _formKey.currentState;
//                               if (form!.validate()) {
//                                 set(() {
//                                   _isLoading = true;
//                                 });

//                                 final response =
//                                     collecteProvider.addEmprunt(emprunt);
//                                 response.then((value) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: CustomSnackBarContent(
//                                         color: AppColors.redColor,
//                                         title: 'Message',
//                                         content: 'Emprunt not created',
//                                       ),
//                                       behavior: SnackBarBehavior.floating,
//                                       backgroundColor: Colors.transparent,
//                                       elevation: 0.5,
//                                     ),
//                                   );
//                                   set(() {
//                                     _isLoading = false;
//                                   });
//                                   Navigator.pop(context);
//                                 });
//                               }
//                             },
//                             child: _isLoading
//                                 ? const CircularProgressIndicator(
//                                     color: AppColors.white,
//                                     strokeWidth: 1,
//                                   )
//                                 : TextWidget(
//                                     text: 'Add',
//                                     color: AppColors.white,
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// const String heroemprunt = 'add-todo-emprunt';

// class EmpruntPopup extends StatefulWidget {
//   final Emprunt emprunt;
//   EmpruntPopup({required this.emprunt});

//   @override
//   State<EmpruntPopup> createState() => _EmpruntPopupState();
// }

// class _EmpruntPopupState extends State<EmpruntPopup> {
//   bool horeved = false;
//   bool horeved2 = false;
//   bool _isloading = false;
//   @override
//   Widget build(BuildContext context) {
//     CollecteProvider collecteProvider = Provider.of<CollecteProvider>(context);
//     bool _isLoading = false;
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(100.0),
//         child: Hero(
//           tag: heroemprunt,
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
//                       title: "Emprunt",
//                       subtitle: "Company Emprunt Managment",
//                       icondata: Icons.money_sharp,
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
//                             text: 'Information du preteur',
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
//                             text: 'Nom du preteur:',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text:
//                                 '${collecteProvider.client.name} ${collecteProvider.client.prenom}',
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
//                             text: 'Type du preteur:',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${collecteProvider.client.email} ',
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
//                             text: 'Identifiant :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${collecteProvider.client.telephone} ',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
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
//                             text: 'Information de \'Emprunteur',
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
//                             text: 'Nom de \'Emprunteur:',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text:
//                                 '${collecteProvider.client.name} ${collecteProvider.client.prenom}',
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
//                             text: 'Type de \'Emprunteur:',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${collecteProvider.client.email} ',
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
//                             text: 'Identifiant :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text: '${collecteProvider.client.telephone} ',
//                             fontWeight: FontWeight.bold,
//                             size: 25,
//                             color: AppColors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         MouseRegion(
//                           onEnter: (event) {
//                             setState(() {
//                               horeved2 = true;
//                             });
//                           },
//                           onExit: (event) {
//                             setState(() {
//                               horeved2 = false;
//                             });
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 100),
//                             child: TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _isloading = true;
//                                 });
//                                 final response = collecteProvider.deleteEmprunt(
//                                   widget.emprunt,
//                                 );
//                                 response.then((value) {
//                                   if (value['statut']) {
//                                     // ScaffoldMessenger.of(context).showSnackBar(
//                                     //   SnackBar(
//                                     //     content: CustomSnackBarContent(
//                                     //       color: AppColors.greenColor,
//                                     //       title: '',
//                                     //       content: value['message'].toString(),
//                                     //     ),
//                                     //     behavior: SnackBarBehavior.floating,
//                                     //     backgroundColor: Colors.transparent,
//                                     //     elevation: 0.5,
//                                     //   ),
//                                     // );
//                                     setState(() {
//                                       _isloading = false;
//                                     });
//                                     Fluttertoast.showToast(
//                                       msg: "Error: ${value['message']}",
//                                     );
//                                     Navigator.pop(context);
//                                   } else {
//                                     Fluttertoast.showToast(
//                                       msg: "Error: ${value['message']}",
//                                     );
//                                   }
//                                 });
//                               },
//                               child: _isLoading
//                                   ? const CircularProgressIndicator(
//                                       color: AppColors.gradient1,
//                                       strokeWidth: 2,
//                                     )
//                                   : Text(
//                                       'Annuler l\'emprunt',
//                                       style: GoogleFonts.poppins(
//                                           color: horeved2
//                                               ? AppColors.redColor
//                                               : AppColors.black,
//                                           fontSize: horeved2 ? 20 : 18),
//                                     ),
//                             ),
//                           ),
//                         ),
//                         MouseRegion(
//                           onEnter: (event) {
//                             setState(() {
//                               horeved = true;
//                             });
//                           },
//                           onExit: (event) {
//                             setState(() {
//                               horeved = false;
//                             });
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 100),
//                             child: TextButton(
//                               onPressed: () {
//                                 print('Tap');
//                               },
//                               child: Text(
//                                 'Validate',
//                                 style: GoogleFonts.poppins(
//                                     color: horeved
//                                         ? AppColors.black
//                                         : AppColors.gradient1,
//                                     fontSize: horeved ? 20 : 18),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
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
