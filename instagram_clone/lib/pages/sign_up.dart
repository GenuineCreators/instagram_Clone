// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unused_local_variable, use_build_context_synchronously, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_screen.dart';
import 'package:instagram_clone/pages/log_in.dart';

class SignUp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignUp({super.key});

  void _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      // Optionally, you can update the user's display name
      await _auth.currentUser?.updateDisplayName(_usernameController.text);
    } catch (e) {
      print('Error signing up: $e');
    }
  }

/*  final TextEditingController? controller;
  const SignUp({super.key, this.controller});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // name
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text("Instagram",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 25),
        //Sign up with Google
        new SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Sign Up with Google',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          ),
        ),
        SizedBox(height: 8),

        // Email
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "UserName", border: InputBorder.none),
              ),
            ),
          ),
        ),

        SizedBox(height: 8),

        //Fullname
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email", border: InputBorder.none),
              ),
            ),
          ),
        ),

        SizedBox(height: 8),

        //Password
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", border: InputBorder.none),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),

        //log in button
        new SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () => _signUpWithEmailAndPassword(context),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          ),
        ),

        // SIGN UP
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Have an account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Text('Log In', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ]),
    );
  }
}

/*
  // ignore: unused_element
  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      // ignore: avoid_print
      print("User is succesfully created");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // ignore: avoid_print
      print("Some error has occured 2");
    }
  }
}

*/