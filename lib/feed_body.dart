import 'package:flutter/material.dart';
import 'package:feed/feed_post.dart';

class FeedBody extends StatelessWidget {
  Widget _buildImagePosts() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ImagePost(
          profilePhotoPath: "images/cat.jpg",
          username: "Andrew",
          imagePath: "images/space.jpg",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImagePosts();
  }
}
