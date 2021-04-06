import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_lesson/models/user.dart';
import 'package:last_lesson/screens/form_screen.dart';

class ShowUser extends StatelessWidget {
  String username, name, surname, phone;
  ShowUser({this.username, this.name, this.surname, this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please edit the user'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(
                    context,
                    User(
                        username: 'delete',
                        name: 'null',
                        surname: 'null',
                        phone: 'null'));
              }),
        ],
      ),
      body: Column(children: [
        Expanded(

          child: Column(
            children:[
              ListTile(
              title: Text('Username : ' + username),
            ),
        ListTile(
            title: Text('Name : ' + name),
          ),
        ListTile(
            title: Text('Surname : ' + surname),
          ),
         ListTile(
            title: Text('Phone : ' + phone),
          ),
        ])),
        Expanded(

          child: Row(children:[
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: Text('Edit'),
                  onPressed: () async {
                    User user = User(
                        username: username,
                        name: name,
                        surname: surname,
                        phone: phone);
                    User newUser = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Create_Form(username: user.username,name: user.name,surname: user.surname,phone: user.phone,text: "User has been edited successfully",)));
                    if (newUser.name.length != 0 &&
                        newUser.username.length != 0 &&
                        newUser.surname.length != 0 &&
                        newUser.phone.length != 0) {
                      user.name = newUser.name;
                      user.surname = newUser.surname;
                      user.username = newUser.username;
                      user.phone = newUser.phone;
                    }

                    Navigator.pop(context, user);
                  },
                ),
              ),
            ),
          Spacer(),
         Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ]),
      )]
      )

    );
  }
}
