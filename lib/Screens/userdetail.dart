import 'package:api_problem/Services/user_services.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  final String userId;
  UserDetail({this.userId});
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  var futureUser;
  final userServices = new UserServices();

  // @override
  // void initState() {
  //   super.initState();
  //   futureUser = userServices.fetchUser(query: widget.userId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single user Details'),
      ),
      body: FutureBuilder(
        future: userServices.fetchUser(query: widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(snapshot.data[0].id),
                      Text(snapshot.data[0].email),
                      Text(snapshot.data[0].name),
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
