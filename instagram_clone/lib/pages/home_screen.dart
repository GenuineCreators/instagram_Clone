// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/new_page.dart';
import 'package:instagram_clone/pages/profile_page.dart';
import 'package:instagram_clone/pages/reel_page.dart';
import 'package:instagram_clone/pages/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    NewPage(),
    ReelPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // My body

      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // Bottom Navigaton Bar
      bottomNavigationBar: GNav(
        padding: EdgeInsets.all(12),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.add_a_photo,
            text: 'New',
          ),
          GButton(
            icon: Icons.video_file,
            text: 'Reels',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}








      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_a_photo),
      //       label: 'New',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     // Add more bottom navigation bar items as needed
      //   ],
      
  



















/*
      bottomNavigationBar: GNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        padding: EdgeInsets.all(12),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.add_a_photo,
            text: 'New',
          ),
          GButton(
            icon: Icons.video_file,
            text: 'Reels',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
*/

/*
      bottomNavigationBar: BottomNavigationBar(
      
        items: [
          //home icon
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          // search icon
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          //NEW POST
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
          ),
          // RELLS
          BottomNavigationBarItem(
            icon: Icon(Icons.video_file),
          ),
          //PROFILE
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
      */
  
