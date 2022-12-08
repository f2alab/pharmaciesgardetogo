
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class MapsActivity extends StatefulWidget
{
  const MapsActivity({Key? key}) : super(key: key);

  @override
  State<MapsActivity> createState() => _MapsActivityState();
}

class _MapsActivityState extends State<MapsActivity> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MesWidgets.MonAppBar(
          leading: MesWidgets.MonBoutonRetour(context),
          titre: "Google Maps"),
        body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Go'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  /*@override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: MesWidgets.MonAppBar(
              leading: MesWidgets.MonBoutonRetour(context),
              titre: "Google Maps"),
          body: MesWidgets.PasDeCorrespondance("LOCALISATION PHARMACIE"),
        )
    );
  }*/
}
