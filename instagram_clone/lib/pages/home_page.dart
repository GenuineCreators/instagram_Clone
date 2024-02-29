// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post {
  final String id;
  final String imageUrl;
  final String description;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.timestamp,
  });
}

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
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              List<Post> posts = snapshot.data!.docs.map((doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Post(
                  id: doc.id,
                  imageUrl: data['imageUrl'],
                  description: data['description'],
                  timestamp: (data['timestamp'] as Timestamp).toDate(),
                );
              }).toList();
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return _buildPostCard(context, posts[index]);
                },
              );
            },
          ),
        ));
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              post.imageUrl,
              //'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.bookmark_border)),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "22000 likes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Row(
                  children: [
                    Text(
                      "username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        post.description,
                      ),
                      //"This is a very beautiful photo"),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    DateFormat.yMMMd().format(post.timestamp),
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  // StreamBuilder(
  //   stream:
  //       FirebaseFirestore.instance.collection('posts').snapshots(),
  //   builder: (context,
  //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     }

//                 return ListView.builder(
//                     itemCount: posts.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 12,
//                                   backgroundImage: NetworkImage(
//                                       'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 8.0),
//                                     child: Text(
//                                       "Username",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.more_horiz),
//                                   onPressed: () {},
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.35,
//                               width: double.infinity,
//                               child: Image.network(

//                                 'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.favorite,
//                                       color: Colors.red,
//                                     )),
//                                 IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.comment_outlined,
//                                     )),
//                                 IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.send,
//                                     )),
//                                 Expanded(
//                                     child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.bookmark_border)),
//                                 ))
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "22000 likes",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "username",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 8.0),
//                                         child: Text(
//                                             "This is a very beautiful photo"),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//               },
//             )));
//   }
// }

