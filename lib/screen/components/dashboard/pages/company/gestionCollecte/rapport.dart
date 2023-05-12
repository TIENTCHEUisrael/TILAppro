import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/screen/components/dashboard/pages/company/gestionCollecte/rapportPages/rapportAdd.dart';

import '../../../../../../models/rapport.dart';
import '../../../../../../services/providers/providerRapport.dart';
import '../../../../../../style/colors.dart';
import '../../../../../../style/style.dart';
import '../../../../../widgets/custum.dart';
import '../../../../../widgets/head.dart';

class RapportPage extends StatefulWidget {
  RapportPage();

  @override
  State<RapportPage> createState() => _RapportPageState();
}

class _RapportPageState extends State<RapportPage> {
  final TextEditingController _searchController = TextEditingController();
  String rapportPath = "assets/images/svg/finance1.svg";
  bool _isSearching = false;
  bool hovered = false;
  bool hoveredButton = false;
  bool _isloading = true;
  bool _isloading2 = false;
  List<Rapport> _rapport = [];

  @override
  void initState() {
    getRapport();
    super.initState();
  }

  Future<void> getRapport() async {
    await RapportProvider.getRapports().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _rapport = value;
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
  }

  @override
  Widget build(BuildContext context) {
    RapportProvider rapportProvider = Provider.of<RapportProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(children: [
          headContent(
            title: "Rapport",
            subtitle: "Company Rapport Managment",
            icondata: Icons.emergency,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: Row(children: [
              const TextWidget(
                text: 'Ajouter un rapport',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return RapportAddPage();
                        },
                      ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextWidget(
                    text: 'Number',
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
                      text: 'rapport not found ...',
                      color: AppColors.black,
                    ),
                  )
                : ListView.builder(
                    itemCount: _rapport.length,
                    itemBuilder: (context, items) {
                      return card(_rapport[items], context);
                    },
                  ),
          ),
        ]),
      ),
    );
  }

  Widget card(Rapport rapport, BuildContext ctx) {
    RapportProvider rapportProvider = Provider.of<RapportProvider>(ctx);
    return _isloading2
        ? Container()
        : Hero(
            tag: "herorapport",
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
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      height: 30,
                      width: 90,
                      child: Center(
                        child: TextWidget(
                          text: rapport.number,
                          size: 12,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  title: TextWidget(
                    text: rapport.createdAt.toString(),
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          );
  }
}
