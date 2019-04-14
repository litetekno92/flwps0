import 'package:flutter/material.dart';
import 'package:flwps0/models/embedpost.dart';
import 'package:transparent_image/transparent_image.dart';

class SinglePost extends StatelessWidget {

  final Post post;
  SinglePost({Key key, @required var this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(post.title.rendered),
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: post.featuredMedia == 0
                  ? 'images/placeholder.png'
                  : post.embedded.wpFeaturedmedia[0].sourceUrl,
            ),
            new Text(post.content.rendered.replaceAll(new RegExp(r'<[^>]*>'), ''))
          ],
        ),
      ),
    );
  }
}
