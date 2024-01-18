import 'package:flutter/material.dart';
import 'package:putra_go/screens/passenger/authenticate/userLogin.dart';
import 'package:putra_go/screens/passenger/authenticate/userRegister.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userLogin(),
    );
  }
}