// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// const String heroask = 'add-todo-ask';

// class AskPopup extends StatefulWidget {
//   const AskPopup({super.key});

//   @override
//   State<AskPopup> createState() => _AskPopupState();
// }

// class _AskPopupState extends State<AskPopup> {
//   @override
//   Widget build(BuildContext context) {
//     RequestProvider requestProvider = Provider.of<RequestProvider>(context);
//     final title = TextEditingController();
//     final message = TextEditingController();
//     bool isloading = false;
//     final _formKey = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(50.0),
//         child: Hero(
//           tag: heroask,
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
//                               text: 'Ajouter un Communique',
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
//                                 controller: title,
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
//                                     text: 'Titre du Communique',
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
//                                     return 'Entrer le titre ';
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
//                                 controller: message,
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
//                                     text: 'Message',
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
//                                     return 'Entrer l\message';
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
//                             onPressed: () {
//                               setState(() {
//                                 isloading = true;
//                               });
//                               Communique communique = Communique(
//                                 message: message.text,
//                                 title: title.text,
//                                 createdAt: DateTime.now().toString(),
//                               );
//                               try {
//                                 requestProvider
//                                     .addCommunique(communique)
//                                     .then((value) {
//                                   setState(() {
//                                     isloading = false;
//                                   });
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: CustomSnackBarContent(
//                                       color: AppColors.greenColor,
//                                       title: 'Message',
//                                       content: 'Communique created',
//                                     ),
//                                     behavior: SnackBarBehavior.floating,
//                                     backgroundColor: Colors.transparent,
//                                     elevation: 0.5,
//                                   ),
//                                 );
//                                 Navigator.pop(context);
//                               } catch (error) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: CustomSnackBarContent(
//                                       color: AppColors.redColor,
//                                       title: 'Message',
//                                       content: 'Communique not created',
//                                     ),
//                                     behavior: SnackBarBehavior.floating,
//                                     backgroundColor: Colors.transparent,
//                                     elevation: 0.5,
//                                   ),
//                                 );
//                                 Navigator.pop(context);
//                               }
//                             },
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

// const String herorequestadd = 'add-todo-askadd';

// class AddAddRequestPopup extends StatefulWidget {
//   final User user;
//   const AddAddRequestPopup({required this.user});

//   @override
//   State<AddAddRequestPopup> createState() => _AddAddRequestPopupState();
// }

// class _AddAddRequestPopupState extends State<AddAddRequestPopup> {
//   @override
//   Widget build(BuildContext context) {
//     RequestProvider requestProvider = Provider.of<RequestProvider>(context);
//     final message = TextEditingController();
//     bool _isLoading = false;
//     final _formKey = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(50.0),
//         child: Hero(
//           tag: herorequestadd,
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
//                               text: 'Envoyé votre requete',
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
//                                 controller: message,
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
//                                     text: 'Message',
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
//                                     return 'Entrer le message ';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
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
//                               set(() {
//                                 _isLoading = true;
//                               });
//                               Request invest = Request(
//                                 userId: widget.user.idUser.toString(),
//                                 message: message.text,
//                                 response: "",
//                                 createdAt: DateTime.now().toString(),
//                               );

//                               final response =
//                                   requestProvider.addRequest(invest);
//                               response.then((value) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: CustomSnackBarContent(
//                                       color: AppColors.greenColor,
//                                       title: 'Message',
//                                       content: 'Request  created',
//                                     ),
//                                     behavior: SnackBarBehavior.floating,
//                                     backgroundColor: Colors.transparent,
//                                     elevation: 0.5,
//                                   ),
//                                 );
//                                 set(() {
//                                   _isLoading = false;
//                                 });
//                                 Navigator.pop(context);
//                               });
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

// const String herorequestinfo = 'add-todo-askfin';

// class RequestInfoPopup extends StatefulWidget {
//   final Request request;
//   const RequestInfoPopup({required this.request});

//   @override
//   State<RequestInfoPopup> createState() => _RequestInfoPopupState();
// }

// class _RequestInfoPopupState extends State<RequestInfoPopup> {
//   bool horeved = false;
//   bool horeved2 = false;
//   bool _isloading = false;
//   @override
//   Widget build(BuildContext context) {
//     RequestProvider requestProvider = Provider.of<RequestProvider>(context);
//     final message = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(100.0),
//         child: Hero(
//           tag: herorequestinfo,
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
//                       title: "Request by User",
//                       subtitle: "Company Investissment Managment",
//                       icondata: Icons.request_quote,
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
//                             text: 'Information of User',
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
//                             text: 'Username de l\'employe :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           TextWidget(
//                             text:
//                                 '${requestProvider.user.username}  ${requestProvider.user.cniNumber}',
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
//                             text: 'Message de L\'employé :',
//                             color: AppColors.black,
//                             size: 20,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: TextWidget(
//                               text: '${widget.request.message} ',
//                               fontWeight: FontWeight.bold,
//                               size: 25,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     widget.request.response == ""
//                         ? Form(
//                             key: _formKey,
//                             child: DelayedAnimation(
//                               delay: 150,
//                               child: ConstrainedBox(
//                                 constraints: const BoxConstraints(
//                                   maxWidth: 550,
//                                 ),
//                                 child: TextFormField(
//                                   style: GoogleFonts.poppins(
//                                     color: AppColors.gradient1,
//                                   ),
//                                   controller: message,
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.all(27),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: AppColors.textBorderColor,
//                                         width: 3,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: AppColors.gradient1,
//                                         width: 3,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     hintText: '',
//                                     label: const TextWidget(
//                                       text: 'Reponse',
//                                       color: AppColors.black,
//                                     ),
//                                     suffixIcon: const Padding(
//                                       padding: EdgeInsets.only(right: 8.0),
//                                       child: Icon(
//                                         Icons.edit,
//                                         color: AppColors.gradient1,
//                                       ),
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Entrer la reponse ';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Container(
//                             margin: const EdgeInsets.only(left: 400, top: 10),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 const TextWidget(
//                                   text: 'Reponse :',
//                                   color: AppColors.black,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 Expanded(
//                                   child: TextWidget(
//                                     text: '${widget.request.response} ',
//                                     fontWeight: FontWeight.bold,
//                                     size: 25,
//                                     color: AppColors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
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
//                                 Navigator.pop(context);
//                               },
//                               child: Text(
//                                 'Annuler',
//                                 style: GoogleFonts.poppins(
//                                     color: horeved2
//                                         ? AppColors.redColor
//                                         : AppColors.black,
//                                     fontSize: horeved2 ? 20 : 18),
//                               ),
//                             ),
//                           ),
//                         ),
//                         AnimatedContainer(
//                           duration: const Duration(milliseconds: 100),
//                           child: TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 _isloading = true;
//                               });
//                               Request request = Request(
//                                 idRequest: widget.request.idRequest,
//                                 userId: requestProvider.user.idUser.toString(),
//                                 message: widget.request.message,
//                                 createdAt: DateTime.now().toString(),
//                                 response: message.text,
//                               );
//                               final form = _formKey.currentState;
//                               if (form!.validate()) {
//                                 final response =
//                                     requestProvider.updateRequest(request);
//                                 response.then(
//                                   (value) => {
//                                     if (value.response != "")
//                                       {
//                                         setState(() {
//                                           _isloading = false;
//                                         }),
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           const SnackBar(
//                                             content: CustomSnackBarContent(
//                                               color: AppColors.greenColor,
//                                               title: 'Message',
//                                               content: 'Response sended',
//                                             ),
//                                             behavior: SnackBarBehavior.floating,
//                                             backgroundColor: Colors.transparent,
//                                             elevation: 0.5,
//                                           ),
//                                         ),
//                                         Navigator.pop(context)
//                                       }
//                                     else
//                                       {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           const SnackBar(
//                                             content: CustomSnackBarContent(
//                                               color: AppColors.redColor,
//                                               title: 'Error',
//                                               content: 'Response not sended',
//                                             ),
//                                             behavior: SnackBarBehavior.floating,
//                                             backgroundColor: Colors.transparent,
//                                             elevation: 0.5,
//                                           ),
//                                         ),
//                                       }
//                                   },
//                                 );
//                               }
//                             },
//                             child: _isloading
//                                 ? const CircularProgressIndicator(
//                                     color: AppColors.gradient1,
//                                     strokeWidth: 2,
//                                   )
//                                 : Text(
//                                     'Repondre',
//                                     style: GoogleFonts.poppins(
//                                       color: horeved
//                                           ? AppColors.black
//                                           : AppColors.gradient1,
//                                       fontSize: horeved ? 20 : 18,
//                                     ),
//                                   ),
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
