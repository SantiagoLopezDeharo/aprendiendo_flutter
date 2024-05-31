import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  File? _img;

  void _submit() async {
    final isValida = _formKey.currentState!.validate();
    if (!_isLogin && _img == null)
      return;

    if (isValida) {
      _formKey.currentState!.save();
    try {
      if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(email: email, password: password);
      } else {
          final userCredentials = await _firebase
              .createUserWithEmailAndPassword(email: email, password: password);
          final storageRef = FirebaseStorage.instance.ref().child("user_images").child("${userCredentials.user!.uid}.jpg");
          storageRef.putFile(_img!);
          final imgUrl = await storageRef.getData();
          print(imgUrl);
          await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredentials.user!.uid)
            .set({
              "username" : "to be done...",
              "email" : email,
              "image_url" : imgUrl,
            });
        }
        } on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            //
          }
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message ?? "Authentication failed")));
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset("assets/images/chat.png"),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin) UserImagePicker(onPickImage: (img) {
                            _img = img;
                          },),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email Address",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains("@"))
                                return "Please enter a valid email addres";
                              return null;
                            },
                            onSaved: (v) {
                              email = v!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Password",
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6)
                                return "Password must be at least 6 characaters long";
                              return null;
                            },
                            onSaved: (v) {
                              password = v!;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text(_isLogin ? "Login" : "Signup"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isLogin = !_isLogin;
                                },
                              );
                            },
                            child: Text(_isLogin
                                ? "Create an account"
                                : "I already have an account"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
