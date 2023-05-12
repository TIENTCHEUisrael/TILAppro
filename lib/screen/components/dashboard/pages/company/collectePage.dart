import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/services/providers/providerProduit.dart';

import '../../../../../config/responsive.dart';
import '../../../../../models/produit.dart';
import '../../../../../models/user/user_model.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/style.dart';
import '../../../../widgets/appbarWidget.dart';
import 'gestionCollecte/stocks.dart';
import 'gestionCollecte/produits.dart';
import 'gestionCollecte/rapport.dart';

class CollectionPage extends StatefulWidget {
  final User user;
  const CollectionPage({required this.user});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<Produit> _produits = [];

  @override
  void initState() {
    getProduits();
    super.initState();
  }

  Future<void> getProduits() async {
    print("..........Get Produits...........");
    var invest = await ProduitProvider.getProduits();
    setState(() {
      _produits = invest;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProduitProvider produitProvider = Provider.of<ProduitProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.lightbackground,
        appBar: AppBarWidget(
            icon: Icons.list_alt_outlined, title: "Collection", ctx: context),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width / 1.1,
            child: DefaultTabController(
              length: 3,
              child: widget.user.role == "admin"
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          child: TextWidget(
                            text: "Management of fundraising by employees",
                            color: AppColors.black,
                            size: 14,
                          ),
                        ),
                        Container(
                          height: 0.3,
                          width: MediaQuery.of(context).size.width / 1.5,
                          color: AppColors.black,
                          margin: const EdgeInsets.only(bottom: 15),
                        ),
                        TabBar(
                          isScrollable:
                              Responsive.isMobile(context) ? true : false,
                          indicatorColor: AppColors.gradient1,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.money_sharp,
                                    color: AppColors.black,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const TextWidget(
                                      text: "Produits",
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.money_outlined,
                                    color: AppColors.black,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const TextWidget(
                                      text: "Rapports",
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.money_rounded,
                                    color: AppColors.black,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const TextWidget(
                                      text: "Stocks",
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ProduitsPage(),
                              RapportPage(),
                              StockPage(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error,
                            color: AppColors.gradient1,
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextWidget(
                            text: 'Vous n\'etes pas un administrateur',
                            color: AppColors.gradient1,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }
}
