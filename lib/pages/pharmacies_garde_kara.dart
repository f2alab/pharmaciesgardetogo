import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacie_garde_item_widget.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class PharmaciesGardeKara extends StatefulWidget {
  const PharmaciesGardeKara({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeKara> createState() => _PharmaciesGardeKaraState();
}

class _PharmaciesGardeKaraState extends State<PharmaciesGardeKara> {
  final firebase = FirebaseDatabase.instance;
  final periodeReference = FirebaseDatabase.instance.ref('PERIODE DE GARDE KARA');
  final listeReference = FirebaseDatabase.instance.ref('PHARMACIES DE GARDE KARA');
  String texte = "La Période de Garde s'affichera ici";
  List<PharmaciesGardeItemModels> pharmaListe = [];

  @override
  void initState()
  {
    super.initState();

    listePharmaGarde();
  }

  @override
  Widget build(BuildContext context)
  {
    return
      pharmaListe.isEmpty?const Center(
          child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
      MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_garde_kara"),
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
    /* Theme(
                 data: Theme.of(context).copyWith(
                   scrollbarTheme: const ScrollbarThemeData(
                     thumbColor: MaterialStatePropertyAll(MesCouleurs.vert),
                     radius: Radius.circular(10),

                   )
                 ),
                 child: Scrollbar(
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
                   ),
                 ),
               );*/
    /*return Column(
      children: [
        Center(
            child: Text(periodeGarde(), style: const TextStyle(fontSize: 15, color: Colors.black),)
        ),

        const SizedBox(height: 15,),
        StreamBuilder(
            builder: (context, snapShot)
            {
              final List<PharmaciesListeModels> pharmaliste = [];
              if(snapShot.hasData)
              {

              }
            }),

      ],
    );*/

  }
  /*return PharmaciesItemWidget(
              pharmaNOM: listeFiltrees[index].pharmaNOM,
              pharmaLOC: listeFiltrees[index].pharmaLOC,
              pharmaCONT1: listeFiltrees[index].pharmaCONT1,
              pharmaCONT2: listeFiltrees[index].pharmaCONT2,
              largeur: largeur,
              esFavorie: listeFiltrees[index].esFavorie);
        });*/


  String periodeGarde() {
    //String texte = "";

    firebase.ref('PERIODE DE GARDE LOME').once().then((DatabaseEvent databaseEvent) {
      setState(() {
        texte = databaseEvent.snapshot.value.toString();
      });

    });
    return texte;
  }
  void readData(){
    firebase.ref('PERIODE DE GARDE KARA').once().then((DatabaseEvent databaseEvent) {
      print('Data : ${databaseEvent.snapshot.value}');
    });
  }

  //RECUPERER LISTE DE FIREBASE
  void listePharmaGarde()
  {
    listeReference.onValue.listen((event)
    {
      Map<String, dynamic> liste = Map<String, dynamic>.from(event.snapshot.value as Map) ;
      liste.forEach((key, value)
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

      });
    });
  }
}
