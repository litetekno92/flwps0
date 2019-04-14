import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flwps0/models/embedpost.dart';
import 'package:flwps0/utils/API.dart';
import 'package:flwps0/widgets/card.dart';

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  // List<Post> list = List();
  var posts = new List<Post>();
  var isLoading = false;

  _fetchData() {
    setState(() {
      isLoading = true;
    });
    API.fetchData().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        posts = list.map((model) => Post.fromJson(model)).toList();
   //     posts.forEach((post) => log(post.title));
        isLoading = false;
      });
    });
  }
// transform(UTF8.decoder)
  initState() {
    super.initState();
    _fetchData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wordpress api"),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            // var photo= posts[index];
            
            return PostCard(posts[index]);
          }
          //     child: ListTile(
          //         contentPadding: EdgeInsets.all(10.0),
          //         title: new Text(posts[index].title),
          //         trailing: new Image.network(
          //           posts[index].thumbnailUrl,
          //           fit: BoxFit.cover,
          //           height: 40.0,
          //           width: 40.0,
          //         )),
          //   );
          // },
        )
    );
  }
}
