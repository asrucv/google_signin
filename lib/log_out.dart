import 'package:fire_base/google_sign_provider.dart';
import 'package:fire_base/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${FirebaseAuth.instance.currentUser!.displayName}"),
          Text("${FirebaseAuth.instance.currentUser!.email}"),
          
          ElevatedButton(
              onPressed: () async {
                await FirebaseService().signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: Text('Sign Out')),
              
        ],
      )),
    );
  }
}
