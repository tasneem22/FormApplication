import 'package:flutter/material.dart';
import 'package:last_lesson/models/user.dart';
import 'package:last_lesson/screens/form_screen.dart';
import 'package:last_lesson/screens/show_user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: First_route(),
    );
  }
}

class First_route extends StatefulWidget {
  @override
  _First_routeState createState() => _First_routeState();
}

class _First_routeState extends State<First_route> {
  final _users = <User>[];
  final children = <Widget>[];

  void addItemToList(User user) {
    setState(() {
      _users.insert(0, user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List of Users created so far')),
        body: Container(
            margin: EdgeInsets.only(
                left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: _users.length,
                      itemBuilder: (BuildContext context, int index) {

                        return Container(

                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: ListTile(
                            onTap: ()async{
                              User changed_user=await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowUser(
                                        username: _users[index].username,
                                      name: _users[index].name,
                                      surname:  _users[index].surname,
                                      phone:  _users[index].phone,)));
                             setState(() {
                               if (changed_user != null) {
                                 print(changed_user.username + ' ' +
                                     changed_user.name + ' ' +
                                     changed_user.phone + ' ' +
                                     changed_user.surname + ' ');
                                 _users[index]=changed_user;
                               }
                             });
                              },
                            title:Center(

                            child: Text(
                            '${_users[index].username}',
                            style: TextStyle(fontSize: 18),
                          )),


                          )
                        );

                      }
                      ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            child: Text('Delete'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Create_Form()));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            child: Text('Add'),
                            onPressed: () async {
                              User new_user = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Create_Form()));

                              if (new_user != null) {
                                for (var i = 0; i < _users.length; ++i)
                                  print(_users[i].username);
                                addItemToList(new_user);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
