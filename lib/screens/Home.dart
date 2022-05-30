import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Login.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.5836, -7.6425),
    zoom: 11.5,
  );
  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.white),
                onPressed: (){
                 /* _signOut(); */
                  FirebaseAuth.instance.signOut();

                },
                icon: const Icon(Icons.exit_to_app),
                label: const Text("Sign out"))

          ]),
      body: const GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
/*
Future <void> _signOut()  async{
  BuildContext context;
  await FirebaseAuth.instance.signOut()
      .then((uid) => {
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login())),
  });
}
*/
