import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

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
      body: Center(
        child: Text(user.email.toString()),
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
