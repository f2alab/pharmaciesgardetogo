import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class MapsActivity extends StatefulWidget
{
  const MapsActivity({Key? key}) : super(key: key);

  @override
  State<MapsActivity> createState() => _MapsActivityState();
}

class _MapsActivityState extends State<MapsActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: MesWidgets.MonAppBar(
              leading: MesWidgets.MonBoutonRetour(context),
              titre: "Google Maps"),
          body: MesWidgets.PasDeCorrespondance("LOCALISATION PHARMACIE"),
        )
    );
  }
}
