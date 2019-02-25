import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/post.dart';
import 'package:lab01/ui/list_view_posts.dart';


class ListData extends StatelessWidget {
  Future<List<Post>> loadPost() async {
    String url = "http://jsonplaceholder.typicode.com/posts";
    
    Response resp = await get(url);
    // print(resp.body);
    // Map<String, dynamic> data = json.decode(resp.body);
    List<dynamic> data = json.decode(resp.body);
    List<Post> posts = List();
    data.forEach((d) {
      posts.add(Post.fromJson(d));
    });
    print(posts.length);
    print(posts.elementAt(20).title);
    return posts;
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListData"),
      ),
      
      // body: Column(
      //   children: <Widget>[
      //     RaisedButton(
      //       child: Text("Load Data"),
      //       onPressed: loadPost,
      //     )
      //   ]
      // ),

      body: FutureBuilder(
        future: loadPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError) print("Load data error");
          return snapshot.hasData 
            ? ListViewPosts(posts: snapshot.data, )
            : Center(
                child: CircularProgressIndicator(),
              );
        },
      )
    );
  }



}

