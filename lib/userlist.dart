import 'Models/user.dart';
import 'Screens/postdetail.dart';
import 'Screens/userdetail.dart';
import 'package:flutter/material.dart';

import 'Services/user_services.dart';

class UserList extends StatefulWidget {
  @override
  _AlbumItemsState createState() => _AlbumItemsState();
}

class _AlbumItemsState extends State<UserList> {
  var futureUser;
  final userServices = new UserServices();

  @override
  void initState() {
    super.initState();
    futureUser = userServices.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<User>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shadowColor: Colors.lightBlue,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (snapshot.data[index].name).toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              snapshot.data[index].email,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => UserDetail(
                                            userId: snapshot.data[index].id)),
                                  );
                                },
                                child: Text('View Details'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PostDetail(
                                          userId: snapshot.data[index].id)));
                                },
                                child: Text('Post/Feeds'),
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("There is a problem loading :(");
            }
          }

          // By default, show a loading spinner.
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
