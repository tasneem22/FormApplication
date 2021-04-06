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
  final users = <User>[];

  void addItemToList(User user) {
    setState(() {
      users.insert(0, user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List of Users created so far')),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: ListTile(
                    onTap: () async {
                      User changedUser =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShowUser(
                                    username: users[index].username,
                                    name: users[index].name,
                                    surname: users[index].surname,
                                    phone: users[index].phone,
                                  )));
                      setState(() {
                        print(changedUser.username +
                            ' ' +
                            changedUser.name +
                            ' ' +
                            changedUser.phone +
                            ' ' +
                            changedUser.surname +
                            ' ');
                        if (changedUser != null &&
                            changedUser.username != 'delete') {
                          print(changedUser.username +
                              ' ' +
                              changedUser.name +
                              ' ' +
                              changedUser.phone +
                              ' ' +
                              changedUser.surname +
                              ' ');
                          users[index] = changedUser;
                        } else if (changedUser.username == 'delete' &&
                            changedUser.name == 'null') {
                          print('this is after deletion' +
                              changedUser.username +
                              '  ' +
                              changedUser.name);
                          users.remove(users[index]);
                        }
                      });
                    },
                    title: Center(
                        child: Text(
                      '${users[index].username}',
                      style: TextStyle(fontSize: 18),
                    )),
                  ));
                }),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  User newUser = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Create_Form(username: '',name: '',surname: '',phone: '',text: "User has been created successfully",)));

                  if (newUser != null) {
                    for (var i = 0; i < users.length; ++i)
                      print(users[i].username);
                    addItemToList(newUser);
                  }
                },
              ),
            ),
          ))
        ]));
  }
}
