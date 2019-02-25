import 'package:flutter/material.dart';
import 'package:lab01/model/post.dart';

class ListViewPosts extends StatelessWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemCount: posts.length, //has to use this to tell where to end
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(this.posts.elementAt(index).title),
                subtitle: Text(this.posts.elementAt(index).body),
                onTap: () {
                  print("Tab on ${this.posts.elementAt(index).id}");
                }
              )
            ],
          );
        },
      ),
    );
  }


}