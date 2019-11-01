import 'package:flutter/material.dart';

class ImagePost extends StatefulWidget {
  final String profilePhotoPath;
  final String username;
  final String imagePath;

  ImagePost({this.profilePhotoPath, this.username, this.imagePath});

  _ImagePostState createState() => _ImagePostState(
        profilePhotoPath: this.profilePhotoPath,
        username: this.username,
        imagePath: this.imagePath,
      );
}

class _ImagePostState extends State<ImagePost> {
  final String profilePhotoPath;
  final String username;
  final String imagePath;

  _ImagePostState({this.profilePhotoPath, this.username, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildPostHeader(),
        _buildImage(),
        _buildSubSection(),
        _buildComment(),
      ],
    );
  }

  Widget _buildPostHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: ExactAssetImage(this.profilePhotoPath),
          radius: 23,
        ),
        title: Text(
          this.username,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: _pushImagePostDetail,
      child: Image.asset(
        this.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  void _pushImagePostDetail() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                this.username,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Image.asset(
                this.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.favorite_border,
              size: 27,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.crop_3_2,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(this.profilePhotoPath),
              radius: 22,
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 19,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add a comment...",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
