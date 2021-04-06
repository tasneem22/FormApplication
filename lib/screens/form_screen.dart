import 'package:flutter/material.dart';
import 'package:last_lesson/models/user.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Create_Form extends StatefulWidget {
  String username, name, surname, phone, text;
  Create_Form({this.username, this.name, this.surname, this.phone, this.text});

  @override
  _Create_FormState createState() => _Create_FormState();
}

class _Create_FormState extends State<Create_Form> {
  String username = '', name = '', surname = '', phone = '';
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new user data')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(

              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min ,
                  children: [
                Expanded(
                  child: TextFormField(
                    initialValue: widget.username,
                    onChanged: (value) {
                      username = value;
                    },
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.name,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.surname,
                    onChanged: (value) {
                      surname = value;
                    },
                    decoration: InputDecoration(labelText: 'Surname'),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.phone,
                    inputFormatters: [maskFormatter],
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(child: Spacer()),
                Expanded(
                  child: Row(children: [
                    Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: ElevatedButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )),
                    Spacer(),
                    Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                              child: Text('Save'),
                              onPressed: () {
                                User user = User(
                                    username: username,
                                    name: name,
                                    surname: surname,
                                    phone: phone);
                                if (_formKey.currentState.validate()) {
                                  Navigator.pop(context, user);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(widget.text)));
                                }
                              },
                            )))
                  ]),
                )
              ])),
        ),
      ),
    );
  }
}
