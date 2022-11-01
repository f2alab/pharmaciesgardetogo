import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pharmacie_garde_item_widget.dart';

class PharmaciesGardeLome extends StatefulWidget {
  const PharmaciesGardeLome({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeLome> createState() => _PharmaciesGardeLomeState();
}

class _PharmaciesGardeLomeState extends State<PharmaciesGardeLome>
{
  final firebase = FirebaseDatabase.instance;
  final periodeReference = FirebaseDatabase.instance.ref('PERIODE DE GARDE LOME');
  final listeReference = FirebaseDatabase.instance.ref('PHARMACIES DE GARDE LOME');
  String texte = "La Période de Garde s'affichera ici";
  //List<PharmaciesListeModels> pharmaListe = [];
  List<PharmaciesGardeItemModels> pharmaListe = [];
  static const double hauteurSizeBoxMarquee = 30;

  @override
  void initState()
  {
    super.initState();

    listePharmaGarde();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PharmaG-Lomé"),
        actions: [
          IconButton(
          icon: const Icon(Icons.save_alt),
          onPressed: (){
            sauvegarder();
          },),
        ],
      ),
      body: pharmaListe.isEmpty?const Center(
          child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
      MesWidgets.MaScrollBarListe(
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
        ),)
    );
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

    return
      pharmaListe.isEmpty?const Center(
        child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
      MesWidgets.MaScrollBarListe(
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

    return CustomScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverToBoxAdapter(
          child: Card(
            elevation: 20,
            color: MesCouleurs.blanc,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: SizedBox(
              height: hauteurSizeBoxMarquee,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                child: Marquee(
                  text: periodeGarde(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    //fontFamily: "SeaSidero",
                    color: MesCouleurs.vert,
                  ),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0,
                  velocity: 25,
                  startPadding: 10.0,
                ),
              ),
            ),
          ),
        ),
        SliverList(

          delegate: SliverChildBuilderDelegate((context, index){
            return PharmaciesGardeItemWidget(
              pharmaNOM: pharmaListe[index].pharmaNOM ,
              pharmaLOC: pharmaListe[index].pharmaLOC,
              pharmaCONT1: pharmaListe[index].pharmaCONT1,
              pharmaCONT2: pharmaListe[index].pharmaCONT2,);
          },
              childCount: pharmaListe.length),

        )
      ],
    );
  }

  String periodeGarde() {
    //String texte = "";
    firebase.ref('PERIODE DE GARDE LOME').once().then((DatabaseEvent databaseEvent) {
      setState(() {
        texte = databaseEvent.snapshot.value.toString();
      });

    });
    return texte;
  }

  void sauvegarder()async
  {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("pharma_garde_lome", pharmaListe.toString());
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
        setState(() async {
          pharmaListe.add(pharmacie);
          pharmaListe.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));

          var prefs = await SharedPreferences.getInstance();
          prefs.setString("pharma_garde_lome", liste.toString());
        });

      });
    });
  }

  void sauvegarderListePharmaGarde()
  {
    listeReference.onValue.listen((event)
    {
      Map<String, dynamic> liste = Map<String, dynamic>.from(event.snapshot.value as Map) ;
      liste.forEach((key, value)
      {
        var pharmaMap = Map<String, dynamic>.from(value);

        setState(() async {
          //pharmaListe.add(pharmacie);
          var prefs = await SharedPreferences.getInstance();
          prefs.setString("pharma_garde_lome", pharmaMap.toString());
        });

      });
    });
  }

  void monSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.settings),
              Text(message, style: const TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blueGrey,
        )
    );
  }
}


