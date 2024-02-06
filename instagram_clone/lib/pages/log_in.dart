// ignore_for_file: sort_child_properties_last, unnecessary_new, must_be_immutable, prefer_final_fields, unused_element, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_screen.dart';
import 'package:instagram_clone/pages/sign_up.dart';

class LogIn extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LogIn({super.key});

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // Navigate to the home screen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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

        // Email
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email", border: InputBorder.none),
              ),
            ),
          ),
        ),

        //Password
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", border: InputBorder.none),
              ),
            ),
          ),
        ),
        //log in button
        new SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () => _signInWithEmailAndPassword(context),
            child: Text(
              'Log in',
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
        //GOOGLE LOG IN
        TextButton(
          onPressed: null,
          child: Text('Log In with Google',
              style: TextStyle(color: Colors.blue, fontSize: 16)),
        ),
        //forgot Password
        TextButton(
          onPressed: null,
          child: Text('forgot password', style: TextStyle(color: Colors.blue)),
        ),
        // SIGN UP
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text('Sign up', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ]),
    );
  }
}




















// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
/*
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Username", border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "password", border: InputBorder.none),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle login button press
                // You can add authentication logic here
              },
              child: Text('Login'),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Navigate to registration page
                // You can add navigation logic here
              },
              child: Text('Don\'t have an account? Register here.'),
            ),
          ],
        ));
  }
}

*/
