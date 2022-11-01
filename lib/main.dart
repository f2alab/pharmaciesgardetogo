import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/activites/accueil.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;


void main()async
{
  if(Platform.isAndroid){
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const PharmacieAppli());
  }else{
    runApp(const PharmacieAppli());
    doWhenWindowReady(() {
      const initialSize = Size(380, 700);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }

}

class PharmacieAppli extends StatelessWidget
{
  const PharmacieAppli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.vert,
      systemNavigationBarColor: MesCouleurs.vert,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Accueil()
        //Platform.isAndroid || Platform.isIOS || Platform.isFuchsia ? const Accueil(): const Center(child: Text("data"))

      ,
      theme: ThemeData(
        primarySwatch:MesCouleurs.primaryColor,
          fontFamily: "CenturyGothicBold",
      ),

      builder: (context, child)
      {
        //ignore system scale factor
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor:0.93,
          ),
          child: child ?? Container(),
        );
      },
    );
  }

}
