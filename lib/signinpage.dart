import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/google_sign_provider.dart';
import 'package:fire_base/log_out.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailControler,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "example@gmail.com",
                          labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordControler,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          hintText: "Password",
                          labelText: 'Atlest 8 characters'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, String> dataToSave = {
                          'email': _emailControler.text,
                          'password': _passwordControler.text,
                        };
                        FirebaseFirestore.instance
                            .collection('email_list')
                            .add(dataToSave);
                      },
                      child: const Text('Log in'))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    onPressed: (() async {
                      await FirebaseService().signInWithGoogle();
                      // ignore: use_build_context_synchronously
                      if (FirebaseAuth.instance.currentUser != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogOut()));
                      }
                    }),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 30,
                            child:
                                Image.asset('assets/images/google icon.png')),
                        const SizedBox(
                          width: 40,
                        ),
                        const Text('Sign in with Google'),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
