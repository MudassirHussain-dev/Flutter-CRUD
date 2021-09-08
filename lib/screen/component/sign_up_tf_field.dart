import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm(
      {Key? key,
      required this.formKey,
      required this.username,
      required this.Email,
      required this.Password})
      : super(key: key);
  final GlobalKey formKey;
  String username, Email, Password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: "Please Enter userName"),
            decoration: InputDecoration(
              labelText: "User Name",
              hintText: "thefluttterway",
            ),
            onSaved: (value) => username = value!,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "abc@gmail.com",
            ),
            onSaved: (value) => Email = value!,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "********",
            ),
            onSaved: (password) => Password = password!,
            onChanged: (password) => Password = password,
          ),
        ],
      ),
    );
  }
}
