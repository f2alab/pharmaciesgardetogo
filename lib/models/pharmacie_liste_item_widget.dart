import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_methodes.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: must_be_immutable
class PharmaciesListeItemWidget extends StatefulWidget
{
  final String pharmaNOM;
  final String pharmaLOC;
  final String pharmaCONT1;
  final String pharmaCONT2;
  bool esFavorie;
  final double largeur;

  //const PharmaciesItemWidget({Key? key}) : super(key: key);
  PharmaciesListeItemWidget({Key? key, required this.pharmaNOM, required this.pharmaLOC, required this.pharmaCONT1, required this.pharmaCONT2, required this.largeur, required this.esFavorie}) : super(key: key);


  @override
  State<PharmaciesListeItemWidget> createState() => _PharmaciesListeItemWidgetState();
}

class _PharmaciesListeItemWidgetState extends State<PharmaciesListeItemWidget>
{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> esFavorie;
  Future<void> enregistrerDansFavories(String nomPharma)async
  {
    //final prefs = await SharedPreferences.getInstance();
    final prefs = await _prefs;
    final b = prefs.getBool(nomPharma)??true;
    setState(() {
      esFavorie = prefs.setBool(nomPharma, b).then((bool succes) => b);
    });
    //await prefs.setBool(nomPharma, true);
  }

  enleverDansFavories(String nomPharma)async
  {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(nomPharma);
  }
  /*souvenirFavories(String nomPharma, bool esFavorie)async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      esFavorie = prefs.getBool(nomPharma)!;
      widget.esFavorie = esFavorie;
    });
  }*/

  @override
  void initState() {
    //souvenirFavories(widget.pharmaNOM, widget.esFavorie);
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    const double elevation = 5;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1A8D77),
                    Color(0xFF0E893B),
                    Color(0xFF04146A),
                  ],
                ),
              ),
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.account_balance,
                        color:  Color(0xFF056629),
                      )),
                ),
                title: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                    child: Center(
                      child: Text(
                        widget.pharmaNOM,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.largeur<320?10:15,
                            color: const Color(0xFF056629)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
               trailing: InkResponse(
                 splashColor: Colors.greenAccent,
                 radius: 30,
                 child: Icon(
                   widget.esFavorie==false?Icons.favorite_border: Icons.favorite,
                   color: widget.esFavorie==false?Colors.white: Colors.amberAccent,
                 ),
                 onTap: (){setState(() {
                   widget.esFavorie = !widget.esFavorie;
                   monSnackBar(enregistrerDansFavories(widget.pharmaNOM).toString());
                   if(widget.esFavorie==false)
                   {
                     enleverDansFavories(widget.pharmaNOM);
                   }
                   else{
                     enregistrerDansFavories(widget.pharmaNOM);
                   }

                 });},
               ),

              ),
            ),
            SizedBox(
              height: 5,
              child: Container(
                color: const Color(0xFF76065F),
              ),
            ),
            ListTile(
              title: const Text(
                "COORDONNÉES",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purple),
              ),
              trailing: Material(
                  elevation: elevation,
                  color: Colors.white,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: (){},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.place, color: MesCouleurs.vert),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        widget.pharmaLOC,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: const Color(0xFF0E893B),
              ),
            ),
            ListTile(
              title: const Text(
                "CONTACTS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purple),
              ),
              trailing: Material(
                  elevation: elevation,
                  color: Colors.white,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: (){MesMethodes.appelDialog(context, widget.pharmaNOM, "+228 ${widget.pharmaCONT1}", "+228 ${widget.pharmaCONT2}");},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.phone, color: MesCouleurs.vert),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "+228 ${widget.pharmaCONT1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Visibility(
              visible:
              widget.pharmaCONT2 == "" ? false : true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 3, horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "+228 ${widget.pharmaCONT2}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 3, right: 3),
              child: SizedBox(
                height: 1,
                child: Container(
                  color: const Color(0xFF76065F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ENREGISTRER DANS FAVORIES



  //APPEL DIALOG
  void appelDialog(String nomPharma, String numero1, String numero2)
  {
    String message1 = "Elle est joignable aux numéros ci-après. Cliquez le bouton à droite des numéros pour effectuer un appel au numéro correspondant.";
    String message2 = "Elle est joignable au numéro ci-après. Cliquez le bouton à droite du numéro pour effectuer un appel.";
    const double elevation = 5;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),

        builder: (context)=> Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1A8D77),
                      Color(0xFF0E893B),
                      Color(0xFF04146A),
                    ],
                  ),
                ),
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(Icons.wechat, color: Colors.white),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                    child: Text(
                      "CONTACTER LA $nomPharma ?",
                      style: const TextStyle(
                          fontFamily: "CenturyGothicBold",
                          fontSize: 14,
                          color: MesCouleurs.blanc),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  trailing:  Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){Navigator.of(context).pop();},
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Icon(Icons.cancel, color: Colors.red),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  numero2=="+228 "?message2:message1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "CenturyGothicBold",
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  numero1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MesCouleurs.vert,
                  ),
                ),
                trailing: Material(
                    elevation: elevation,
                    color: Colors.white,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: (){},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.phone, color: MesCouleurs.vert),
                      ),
                    )
                ),
              ),
              Visibility(
                visible: numero2=="+228 "?false:true,
                child: ListTile(
                  title: Text(
                    numero2,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "CenturyGothicBold",
                      color: MesCouleurs.vert,
                    ),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone, color: MesCouleurs.vert),
                        ),
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          //color: const Color(0xFF76065F),
        )
      /*DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.2,
          minChildSize: 0.1,
          maxChildSize: 0.3,
          builder: (context, scrollController)=>Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1A8D77),
                  Color(0xFF0E893B),
                  Color(0xFF04146A),
                ],
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                      child: Center(
                        child: Text(
                          "CONTACTER LA $nomPharma ?",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF056629)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      numero1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.phone, color:  Color(0xFF056629)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Visibility(
                    visible: numero2=="+228 "?false:true,
                    child: ListTile(
                      title: Text(
                        numero2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.phone, color:  Color(0xFF056629)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //color: const Color(0xFF76065F),
          ),
        )*/
    );
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
