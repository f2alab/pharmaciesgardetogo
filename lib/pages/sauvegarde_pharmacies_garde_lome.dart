import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacie_garde_item_widget.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SauvegardePharmaciesGardeLome extends StatefulWidget {
  const SauvegardePharmaciesGardeLome({Key? key}) : super(key: key);

  @override
  State<SauvegardePharmaciesGardeLome> createState() => _SauvegardePharmaciesGardeLomeState();
}

class _SauvegardePharmaciesGardeLomeState extends State<SauvegardePharmaciesGardeLome>
{
  List<PharmaciesGardeItemModels> pharmaListe = [];

  @override
  void initState()
  {
    super.initState();

    listeSauvees();
  }
  @override
  Widget build(BuildContext context)
  {
    return  MesWidgets.MaScrollBarListe(
      context: context,
      child: ListView.builder(
          key: const PageStorageKey<String>("pharma_garde_lome"),
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
      ),);
  }

  void listeSauvees()async
  {
    var prefs = await SharedPreferences.getInstance();
    List<PharmaciesGardeItemModels> pliste = prefs.getString("pharma_garde_lome") as List<PharmaciesGardeItemModels>;
    setState(() {
      pharmaListe = pliste;
    });
    //Map<String, dynamic> liste = prefs.getString("pharma_garde_lome") as Map<String, dynamic>;
    /*liste.forEach((key, value)
    {
      var pharmaMap = Map<String, dynamic>.from(value);
      PharmaciesGardeItemModels pharmacie = PharmaciesGardeItemModels(
          pharmaNOM: pharmaMap ["pharmaNom"],
          pharmaLOC: pharmaMap["pharmaLocal"],
          pharmaCONT1: pharmaMap["pharmaContact1"],
          pharmaCONT2: pharmaMap["pharmaContact2"]);
      setState(() {
        pharmaListe.add(pharmacie);
        pharmaListe.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));

      });

    });*/

  }
}
