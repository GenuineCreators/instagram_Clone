// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onChanged: (value) {
            // Perform search or filtering logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('posts').get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Image.network(
                snapshot.data!.docs[index]['imageUrl'],
                fit: BoxFit.cover,
              ),
              staggeredTileBuilder: (index) => StaggeredTile.count(
                (index % 7 == 0) ? 2 : 1,
                (index % 7 == 0) ? 2 : 1,
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          },
        ),
      ),
    );
  }
}
