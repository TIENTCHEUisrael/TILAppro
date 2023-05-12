import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/models/stock_model.dart';

import '../../../../../../services/providers/providerStock.dart';
import '../../../../../../style/colors.dart';
import '../../../../../../style/style.dart';
import '../../../../../widgets/custum.dart';
import '../../../../../widgets/head.dart';
import '../../../../../widgets/snackbarwidget.dart';

class StockPage extends StatefulWidget {
  StockPage();

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final TextEditingController _searchController = TextEditingController();
  String investissementPath = "assets/images/svg/finance1.svg";
  bool _isSearching = false;
  bool hovered = false;
  bool hoveredButton = false;
  bool _isloading = true;
  bool _isloading2 = false;
  List<Stock> _stock = [];

  @override
  void initState() {
    getStocks();
    super.initState();
  }

  Future<void> getStocks() async {
    await StockProvider.getStocks().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _stock = value;
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
    StockProvider stockProvider = Provider.of<StockProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            headContent(
              title: "Stock",
              subtitle: "Company Stock Managment",
              icondata: Icons.monitor,
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
                          text: 'Nom Produit',
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextWidget(
                          text: 'Quantity',
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
                      child: CircularProgressIndicator(
                        color: AppColors.gradient1,
                        strokeWidth: 1,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _stock.length,
                      itemBuilder: (context, items) {
                        return card(_stock[items], context);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card(Stock stock, BuildContext ctx) {
    StockProvider stockProvider = Provider.of<StockProvider>(ctx);
    return InkWell(
      onTap: () {
        setState(() {
          _isloading2 = true;
        });
        stockProvider.getStock(stock).then((value) {
          try {
            print('.........................');
            if (value != null) {
              setState(() {
                _isloading2 = false;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: CustomSnackBarContent(
                    color: AppColors.greenColor,
                    title: 'Error',
                    content: 'Stock not found',
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
          ? Container(
              color: AppColors.white,
            )
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
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      leading: TextWidget(
                        text: stock.nomProduit,
                        size: 18,
                        color: AppColors.black,
                      ),
                      title: Container(
                        margin: const EdgeInsets.only(left: 80),
                        child: TextWidget(
                          text: stock.quantity.toString(),
                          color: AppColors.black,
                        ),
                      ),
                      trailing: Container(
                        margin: const EdgeInsets.only(right: 40),
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 30, left: 30),
                              width: 50,
                              child: Expanded(
                                child: TextWidget(
                                  text: stock.quantity.toString(),
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextWidget(
                                text: stock.date.toString(),
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
