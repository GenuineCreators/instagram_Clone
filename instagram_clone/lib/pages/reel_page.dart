import 'package:flutter/material.dart';

class ReelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual number of reels
        itemBuilder: (context, index) {
          return ReelItem(
            imageUrl:
                'https://images.unsplash.com/photo-1548195667-1d329af0a472?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ViVDMyVBRGRlbyUyMEhEfGVufDB8fDB8fHww', // Replace with actual image URL
            title: 'Reel $index', // Replace with actual reel information
            description:
                'Description of the reel $index', // Replace with actual reel description
          );
        },
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ReelItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(),
        ],
      ),
    );
  }
}
