import 'package:flutter/material.dart';
import 'package:last_lesson/models/user.dart';

class Create_Form extends StatefulWidget {
  @override
  _Create_FormState createState() => _Create_FormState();
}

class _Create_FormState extends State<Create_Form> {



  String username = '', name  = '' ,surname='',phone='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add a new user data')),
        body: Container(
          margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
          child: Column(children: <Widget>[

            ListTile(
                title:TextField(
                  onChanged: (value){
                    username=value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Username'
                  ),
                )
            ),
            Divider(),
            ListTile(
                title:TextField(
                  onChanged: (value){
                    name=value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Name'
                  ),
                )
            ),
            Divider(),
            ListTile(
                title:TextField(
                  onChanged: (value){
                    surname=value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Surname'
                  ),
                )
            ),
            Divider(),
            ListTile(
                title:TextField(
                  onChanged: (value){
                    phone=value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone'
                  ),
                )
            ),
          Divider(),

          Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  child: Text('Cancel'),
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
                  child: Text('Save'),
                  onPressed: () {
                    User user=User(
                        username:username,
                        name:name,
                        surname:surname,
                        phone:phone);
                    Navigator.pop(context,user);
                  },
                ),
              ),
            )
          ]),

          ]),
        )
    );
  }
}


