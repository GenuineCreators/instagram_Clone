// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
