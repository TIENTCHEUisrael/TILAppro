import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/fournisseur.dart';
import '../../../../../../models/produit.dart';
import '../../../../../../services/providers/providerFournisseur.dart';
import '../../../../../../services/providers/providerProduit.dart';
import '../../../../../../style/colors.dart';
import '../../../../../../style/style.dart';
import '../../../../../widgets/custum.dart';
import '../../../../../widgets/head.dart';
import '../../../../../widgets/investissementpopup.dart';
import '../../../../../widgets/snackbarwidget.dart';

class ProduitsPage extends StatefulWidget {
  ProduitsPage();

  @override
  State<ProduitsPage> createState() => _ProduitsPageState();
}

class _ProduitsPageState extends State<ProduitsPage> {
  final TextEditingController _searchController = TextEditingController();
  String produitsPath = "assets/images/svg/finance1.svg";
  bool _isSearching = false;
  bool hovered = false;
  bool hoveredButton = false;
  bool _isloading = true;
  bool _isloading2 = false;
  List<Produit> _produits = [];
  List<Fournisseur> _fournisseur = [];

  @override
  void initState() {
    getProduits();
    getFournisseur();
    super.initState();
  }

  Future<void> getProduits() async {
    await ProduitProvider.getProduits().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _produits = value;
              })
            }
          else if (value == [])
            {
              setState(() {
                _isloading = false;
              })
            }
        });
  }

  Future<void> getFournisseur() async {
    await FournisseurProvider.getFournisseurs().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _fournisseur = value;
                _isloading = false;
              })
            }
          else if (value == [])
            {
              setState(() {
                _isloading = false;
              })
            }
        });
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(children: [
          headContent(
            title: "Produits",
            subtitle: "Company Products Managment",
            icondata: Icons.money,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: Row(children: [
              const TextWidget(
                text: 'Ajouter un Produits',
                color: AppColors.black,
                size: 18,
              ),
              const SizedBox(
                width: 20,
              ),
              Hero(
                tag: "heroAddTodo",
                createRectTween: (begin, end) {
                  return CustomRectTween(begin: begin!, end: end!);
                },
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gradient1,
                    padding: const EdgeInsets.all(10),
                    minimumSize: hoveredButton
                        ? const Size(205, 55)
                        : const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onHover: (value) {
                    setState(() {
                      hoveredButton = true;
                    });
                  },
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AddProduitPopup(
                          fournisseurs: _fournisseur,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 18,
                  ),
                  label: const TextWidget(
                    text: 'Add',
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
            width: MediaQuery.of(context).size.width / 2,
            child: ListTile(
              leading: TextWidget(
                text: 'Filter :',
                color: AppColors.gradient1,
                size: 25,
              ),
              title: TextField(
                controller: _searchController,
                style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontSize: 15,
                ),
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: 10,
                  ),
                  icon: Icon(
                    Icons.search,
                    color: AppColors.black,
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.textBorderColor,
                ),
                bottom: BorderSide(
                  color: AppColors.textBorderColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextWidget(
                        text: 'Statuts',
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextWidget(
                        text: 'Nom',
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextWidget(
                        text: 'Montant',
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextWidget(
                        text: 'Date',
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.containergreyColor,
            ),
            height: MediaQuery.of(context).size.height / 2,
            child: _isloading
                ? const Center(
                    child: TextWidget(
                      text: 'Produits not found ...',
                      color: AppColors.black,
                    ),
                  )
                : ListView.builder(
                    itemCount: _produits.length,
                    itemBuilder: (context, items) {
                      return card(_produits[items], context);
                    },
                  ),
          ),
        ]),
      ),
    );
  }

  Widget card(Produit produit, BuildContext ctx) {
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(ctx);
    return InkWell(
      onTap: () {
        setState(() {
          _isloading2 = true;
        });
        produitProvider.getProduit(produit).then((value) {
          try {
            print('.........................');
            if (value != null) {
              setState(() {
                _isloading2 = false;
              });
              Navigator.of(ctx).push(
                DialogRoute(
                  context: ctx,
                  builder: (context) {
                    return ProduitPopupCard(
                      produit: produit,
                    );
                  },
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: CustomSnackBarContent(
                    color: AppColors.greenColor,
                    title: 'Error',
                    content: 'Client not found',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0.5,
                ),
              );
            }
          } catch (e) {
            print(e);
          }
        });
      },
      child: _isloading2
          ? Container()
          : Hero(
              tag: "heroAddTodo",
              createRectTween: (begin, end) {
                return CustomRectTween(begin: begin!, end: end!);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                elevation: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: AppColors.white,
                  child: ListTile(
                    mouseCursor: SystemMouseCursors.click,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: produit.statut
                              ? AppColors.black
                              : AppColors.redColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: produit.statut ? "Non Commandé" : "Commandé",
                            size: 12,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    title: TextWidget(
                      text: produit.name,
                      color: AppColors.black,
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.only(right: 40),
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextWidget(
                            text: produit.price.toString(),
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            size: 18,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 150,
                            child: Expanded(
                              child: TextWidget(
                                text: produit.createdAt,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                size: 18,
                              ),
                            ),
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
