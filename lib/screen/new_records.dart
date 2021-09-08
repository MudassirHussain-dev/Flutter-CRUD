import 'dart:convert';

import 'package:basic_operation/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'component/sign_up_tf_field.dart';
import 'package:http/http.dart' as http;

class NewRecords extends StatefulWidget {
  const NewRecords({Key? key}) : super(key: key);

  @override
  _NewRecordsState createState() => _NewRecordsState();
}

class _NewRecordsState extends State<NewRecords> {
  final _formKey = GlobalKey<FormState>();
  var username, Email, Password;
  bool visible = false;

/*  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controlle

    // SERVER API URL
    //url = 'https://flutter-examples.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'username': "dfjalkdfj", 'email': "dfadsfasd", 'password': "dfadsfasdfas"};

    // Starting Web API Call.
    var response = await http.post(Uri.parse("http://192.168.2.39/UserApi/register1.php"), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/
  Future register() async {
    var response = await http.post(Uri.parse("http://192.168.2.39/UserApi/register1.php"), body: {
      "username": username,
      "email": Email,
      "password": Password,
    });
    var json = jsonDecode(response.body);
    Fluttertoast.showToast(
        msg: json,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        validator: RequiredValidator(
                            errorText: "Please Enter userName"),
                        decoration: InputDecoration(
                          labelText: "User Name",
                          hintText: "thefluttterway",
                        ),
                        onChanged: (value) => username = value,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "Please Enter Email"),
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "abc@gmail.com",
                        ),
                        onChanged: (value) => Email = value,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: passwordValidator,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "********",
                        ),
                        // onSaved: (password) => Password = password!,
                        onChanged: (password) => Password = password,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          register();
                          /* print(Password);
                          print(username);
                          print(Email);
                          print("work");*/
                          // _formKey.currentState!.save();

                        }
                      },
                      child: Text("Register"),
                    ),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
