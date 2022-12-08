import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacie_garde_item_widget.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SauvegardePharmaciesGardeKara extends StatefulWidget {
  const SauvegardePharmaciesGardeKara({Key? key}) : super(key: key);

  @override
  State<SauvegardePharmaciesGardeKara> createState() => _SauvegardePharmaciesGardeKaraState();
}

class _SauvegardePharmaciesGardeKaraState extends State<SauvegardePharmaciesGardeKara>
{
  List<PharmaciesGardeItemModels> pharmaListe = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState()
  {
    super.initState();
    listeSauvees();
  }
  @override
  Widget build(BuildContext context) {
    return  MesWidgets.MaScrollBarListe(
      context: context,
      controller: scrollController,
      child: pharmaListe.isEmpty?MesWidgets.PasDeCorrespondance("Pas de sauvegarde!"):
      ListView.builder(
          key: const PageStorageKey<String>("pharma_garde_kara"),
          controller: scrollController,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(10),
          itemCount: pharmaListe.length,
          itemBuilder: (context, index)
          {
            return PharmaciesGardeItemWidget(
              pharmaNOM: pharmaListe[index].pharmaNOM ,
              pharmaLOC: pharmaListe[index].pharmaLOC,
              pharmaCONT1: pharmaListe[index].pharmaCONT1,
              pharmaCONT2: pharmaListe[index].pharmaCONT2,);
          }
      ),
    );
  }

  void listeSauvees()async
  {
    var prefs = await SharedPreferences.getInstance();
    //String? liste = prefs.getString("pharma_garde_lome");
    String jsonListe = prefs.getString("pharma_garde_kara")!;
    List<PharmaciesGardeItemModels> maListe = jsonDecode(jsonListe)
        .map((item) => PharmaciesGardeItemModels.fromJson(item))
        .toList()
        .cast<PharmaciesGardeItemModels>();

    setState(() {
      pharmaListe = maListe;
    });
  }
}
