import '../Services/post_services.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final String userId;
  PostDetail({this.userId});
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  var futurePost;
  final postServices = new PostServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post And Feeds Screen'),
      ),
      body: FutureBuilder(
          future: postServices.fetchPost(query: widget.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                    children: [
                      Text(snapshot.data[index].id),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.indigo[50],
                          child: Text(snapshot.data[index].body)),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ));
                },
              );
            } else if (snapshot.hasError) {
              return Text('Eror snapshot');
            }
            return LinearProgressIndicator();
          }),
    );
  }
}
