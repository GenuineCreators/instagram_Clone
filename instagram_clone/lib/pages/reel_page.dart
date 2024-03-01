// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
          return _buildReelItem(context, index);
        },
      ),
    );
  }

  Widget _buildReelItem(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(
              // ignore: deprecated_member_use
              VideoPlayerController.network(
                  'https://www.pexels.com/video/slow-motion-wave-18680290/'),
            ),
          ),
          SizedBox(height: 8),
          Divider(),
        ],
      ),
    );
  }
}
