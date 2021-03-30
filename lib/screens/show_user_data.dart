import 'package:flutter/material.dart';
import 'package:last_lesson/models/user.dart';
import 'package:last_lesson/screens/form_screen.dart';

class ShowUser extends StatelessWidget {
  String username, name, surname, phone;
  ShowUser({this.username, this.name, this.surname, this.phone});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Please edit the user')),
        body: Container(
          margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),

          child: Column(children: [
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
      Row(children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              child: Text('Edit'),
              onPressed: () async{
                User user = User(
                    username: username,
                    name: name,
                    surname: surname,
                    phone: phone);
                    User new_user = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Create_Form()));
                    if(new_user.name.length!=0 && new_user.username.length!=0&&new_user.surname.length!=0&&new_user.phone.length!=0){
                      user.name=new_user.name;
                      user.surname=new_user.surname;
                      user.username=new_user.username;
                      user.phone=new_user.phone;
                    }

                Navigator.pop(context, user);
              },
            ),
          ),
        )
      ]),
    ])),
    );
  }
}
