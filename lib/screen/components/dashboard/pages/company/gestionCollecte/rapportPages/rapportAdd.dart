import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/services/providers/providerCommande.dart';

import '../../../../../../../models/commande.dart';
import '../../../../../../../models/stock_model.dart';
import '../../../../../../../services/providers/providerRapport.dart';
import '../../../../../../../style/colors.dart';
import '../../../../../../../style/style.dart';

class RapportAddPage extends StatefulWidget {
  const RapportAddPage({super.key});

  @override
  State<RapportAddPage> createState() => _RapportAddPageState();
}

class _RapportAddPageState extends State<RapportAddPage> {
  List<Commande>? _commandes;
  List<Stock>? _stocks;
  bool _isloading = true;
  bool _isloading2 = true;
  bool horeved1 = false;
  bool horeved2 = true;
  Color color1 = AppColors.textBorderColor;
  Color color2 = AppColors.textBorderColor;

  @override
  void initState() {
    getCommandes();
    super.initState();
  }

  Future<void> getCommandes() async {
    await Commanderovider.getCommandes().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _commandes = value;
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
    RapportProvider rapportProvider = Provider.of<RapportProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Managment of Rapport',
          color: AppColors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Lottie.asset(
                  "assets/images/json/rapport.json",
                  width: 200,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const TextWidget(
                  text: "Gerer les rapports de l'Entreprise",
                  color: AppColors.gradient1,
                  size: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                width: MediaQuery.of(context).size.width / 10,
                height: 1,
                color: AppColors.gradient1,
              ),
              Container(
                child: Row(
                  children: const [
                    Icon(
                      Icons.person_4_sharp,
                      color: AppColors.gradient1,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "Commandes",
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  TextWidget(
                                    text: 'Date Livraison',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    size: 15,
                                  ),
                                  TextWidget(
                                    text: 'Montant',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    size: 15,
                                  ),
                                  TextWidget(
                                    text: 'Prix unitaire',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 250,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              color: Colors.white,
                              child: _isloading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.gradient1,
                                        strokeWidth: 1,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemBuilder: (context, items) {
                                        return cardWidgetE(_commandes![items]);
                                      },
                                      itemCount: _commandes!.length,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidgetE(Commande commande) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          horeved1 = true;
        });
      },
      onExit: (value) {
        horeved1 = false;
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog();
              });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextWidget(
                text: commande.dateLivraison,
                color: color1,
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              TextWidget(
                text: commande.montant,
                color: color2,
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              TextWidget(
                text: commande.prixUnitaire,
                color: color1,
                fontWeight: FontWeight.bold,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
