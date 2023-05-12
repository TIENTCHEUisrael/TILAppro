import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tilappro/screen/widgets/snackbarwidget.dart';
import '../../models/fournisseur.dart';
import '../../models/produit.dart';
import '../../services/providers/providerProduit.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import 'custum.dart';
import 'package:provider/provider.dart';
import 'delayedAnimation.dart';
import 'head.dart';

/// Tag-value used for the add todo popup button.
const String heroProduit = 'add-todo-hero';

class ProduitPopupCard extends StatefulWidget {
  final Produit produit;

  ProduitPopupCard({required this.produit});

  @override
  State<ProduitPopupCard> createState() => _ProduitPopupCardState();
}

class _ProduitPopupCardState extends State<ProduitPopupCard> {
  bool horeved = false;
  bool horeved2 = false;
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(context);
    bool _isLoading = false;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(100.0),
        child: Hero(
          tag: heroProduit,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    headContent(
                      title: "Produit",
                      subtitle: "Company Produit Managment",
                      icondata: Icons.money,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 280),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.person,
                            color: AppColors.gradient1,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: 'Information of Fournisseur',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Username of Fournisseur :',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // TextWidget(
                          //   text:
                          //       '${produitProvider.fournisseur.name} ${produitProvider.fournisseur.prenom}',
                          //   fontWeight: FontWeight.bold,
                          //   size: 25,
                          //   color: AppColors.black,
                          // ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 400, top: 10),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       const TextWidget(
                    //         text: 'Email of Fournisseur :',
                    //         color: AppColors.black,
                    //         size: 20,
                    //       ),
                    //       const SizedBox(
                    //         width: 20,
                    //       ),
                    //       TextWidget(
                    //         text: '${produitProvider.fournisseur.email} ',
                    //         fontWeight: FontWeight.bold,
                    //         size: 25,
                    //         color: AppColors.black,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 400, top: 10),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       const TextWidget(
                    //         text: 'Phone Number Fournisseur :',
                    //         color: AppColors.black,
                    //         size: 20,
                    //       ),
                    //       const SizedBox(
                    //         width: 20,
                    //       ),
                    //       TextWidget(
                    //         text: '${produitProvider.fournisseur.telephone} ',
                    //         fontWeight: FontWeight.bold,
                    //         size: 25,
                    //         color: AppColors.black,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 400, top: 10),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       const TextWidget(
                    //         text: 'Name of Enterprise :',
                    //         color: AppColors.black,
                    //         size: 20,
                    //       ),
                    //       const SizedBox(
                    //         width: 20,
                    //       ),
                    //       TextWidget(
                    //         text: '${produitProvider.fournisseur.entreprise} ',
                    //         fontWeight: FontWeight.bold,
                    //         size: 25,
                    //         color: AppColors.black,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(left: 280, top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.extension,
                            color: AppColors.gradient1,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: 'Information of Produit',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Nom :',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextWidget(
                              text: '${widget.produit.name}',
                              fontWeight: FontWeight.bold,
                              size: 25,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Quantite :',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextWidget(
                              text: '${widget.produit.quantity}  ',
                              fontWeight: FontWeight.bold,
                              size: 25,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Prix :',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextWidget(
                              text: '${widget.produit.price} ',
                              fontWeight: FontWeight.bold,
                              size: 25,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Description:',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextWidget(
                              text: '${widget.produit.description} ',
                              fontWeight: FontWeight.bold,
                              size: 25,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Date de Creation :',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: '${widget.produit.createdAt} ',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Statut de l\'Produit:',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                color: widget.produit.statut
                                    ? AppColors.black
                                    : AppColors.redColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: widget.produit.statut
                                      ? "Terminé"
                                      : "En cour ....",
                                  size: 12,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              horeved2 = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              horeved2 = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isloading = true;
                                });
                                final response = produitProvider
                                    .deleteProduit(widget.produit);
                                response.then((value) {
                                  if (value['statut']) {
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: CustomSnackBarContent(
                                    //       color: AppColors.greenColor,
                                    //       title: '',
                                    //       content: value['message'].toString(),
                                    //     ),
                                    //     behavior: SnackBarBehavior.floating,
                                    //     backgroundColor: Colors.transparent,
                                    //     elevation: 0.5,
                                    //   ),
                                    // );
                                    setState(() {
                                      _isloading = false;
                                    });
                                    Fluttertoast.showToast(
                                      msg: "Error: ${value['message']}",
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Error: ${value['message']}",
                                    );
                                  }
                                });
                              },
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: AppColors.gradient1,
                                      strokeWidth: 2,
                                    )
                                  : Text(
                                      'Annuler l\'Produit',
                                      style: GoogleFonts.poppins(
                                          color: horeved2
                                              ? AppColors.redColor
                                              : AppColors.black,
                                          fontSize: horeved2 ? 20 : 18),
                                    ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              horeved = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              horeved = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            child: TextButton(
                              onPressed: () {
                                print('Tap');
                              },
                              child: Text(
                                'Validate',
                                style: GoogleFonts.poppins(
                                    color: horeved
                                        ? AppColors.black
                                        : AppColors.gradient1,
                                    fontSize: horeved ? 20 : 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String heroaddProduit = 'add-todo-invest';

class AddProduitPopup extends StatefulWidget {
  final List<Fournisseur> fournisseurs;
  const AddProduitPopup({required this.fournisseurs});

  @override
  State<AddProduitPopup> createState() => _AddProduitPopupState();
}

class _AddProduitPopupState extends State<AddProduitPopup> {
  List<String> types = ['personnel', 'professionnel', 'immobilier'];
  DateTime selectedDate = DateTime.now();
  Fournisseur? fournisseur;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(context);

    final name = TextEditingController();
    final montant = TextEditingController();
    final quantite = TextEditingController();
    final description = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50.0),
        child: Hero(
          tag: heroaddProduit,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: StatefulBuilder(builder: (context, set) {
            return AlertDialog(
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              content: SingleChildScrollView(
                padding: const EdgeInsets.all(
                  30,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const Icon(
                              Icons.add_business,
                              color: AppColors.gradient1,
                              size: 60,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: const TextWidget(
                              text: 'Ajouter un produit',
                              color: AppColors.black,
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DelayedAnimation(
                            delay: 150,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                controller: name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Nom du produit',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.timelapse,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le nom ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 250,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: montant,
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Montant',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.money,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le montant';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 300,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                controller: quantite,
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColors.textBorderColor),
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Quantity',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.date_range,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer votre Quantite';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 350,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                maxLength: 10,
                                maxLines: 3,
                                controller: description,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Motifs',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.description,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le motifs';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 200,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelText: "Fournisseur",
                                  labelStyle: GoogleFonts.poppins(
                                      color: AppColors.black),
                                  prefixIcon: Icon(
                                    Icons.numbers,
                                    color: AppColors.gradient1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                value: fournisseur,
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: AppColors.gradient1,
                                ),
                                dropdownColor: AppColors.white,
                                style: GoogleFonts.poppins(),
                                iconSize: 20,
                                items: widget.fournisseurs.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: TextWidget(
                                      text: '${e.name}',
                                      color: AppColors.black,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  set(() {
                                    fournisseur = value as Fournisseur;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gradient1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 20,
                              ),
                            ),
                            onPressed: () {
                              set(() {
                                _isLoading = true;
                              });
                              try {
                                Produit invest = Produit(
                                    name: name.text,
                                    price: int.parse(montant.text),
                                    fournisseur:
                                        fournisseur!.idFournisseur.toString(),
                                    statut: false,
                                    quantity: int.parse(quantite.text),
                                    description: description.text,
                                    createdAt: DateTime.now().toString());

                                final response =
                                    produitProvider.addProduit(invest);
                                response.then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: CustomSnackBarContent(
                                        color: AppColors.greenColor,
                                        title: 'Message',
                                        content: 'Produit  created',
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.5,
                                    ),
                                  );
                                  set(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: CustomSnackBarContent(
                                      color: AppColors.redColor,
                                      title: 'Message',
                                      content: 'Produit not  created',
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.5,
                                  ),
                                );
                              }
                            },
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 1,
                                  )
                                : TextWidget(
                                    text: 'Add',
                                    color: AppColors.white,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
