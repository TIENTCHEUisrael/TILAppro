import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:tilappro/screen/components/splashscreen.dart';
import 'package:tilappro/services/providers/provider_user.dart';
import 'package:tilappro/style/colors.dart';

import 'services/providers/providerApprovisionnement.dart';
import 'services/providers/providerCommande.dart';
import 'services/providers/providerFacture.dart';
import 'services/providers/providerFournisseur.dart';
import 'services/providers/providerProduit.dart';
import 'services/providers/providerRapport.dart';
import 'services/providers/providerStock.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //Future<bool>? _appTryAutoLogin;
  @override
  void initState() {
    //AuthProvider().logOutUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return AuthProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return ApprovisionnementProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return RapportProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return ProduitProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return FournisseurProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return Commanderovider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return FactureProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return StockProvider();
            },
          ),
        ],
        child: MaterialApp(
          title: 'APPRO',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.darkbackground,
          ),
          debugShowCheckedModeBanner: false,
          // theme: theme,
          // darkTheme: darktheme,
          home: /*auth.isAuth == true
                ? DashboardContent()
                : FutureBuilder<bool>(
                    future: auth.tryAutoLogin(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.gradient1,
                              ),
                            ),
                          );
                        case ConnectionState.none:
                          return SplashScreen();
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SplashScreen();
                          }
                      }
                    },
                  ),*/
              SplashScreen(),
        ));
  }
}
