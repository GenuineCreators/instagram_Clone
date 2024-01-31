// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/log_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                decoration: InputDecoration(
                    labelText: "Email", border: InputBorder.none),
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
                decoration: InputDecoration(
                    labelText: "UserName", border: InputBorder.none),
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
            onPressed: () {},
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
