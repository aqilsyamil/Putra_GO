import 'package:flutter/material.dart';
import '../../../services/auth.dart';
import '../passenger/userHome/userCustomizedOrder.dart';
import 'driverHome/driverSelectOrder.dart';
import 'driverMain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class driverLogin extends StatefulWidget {

  @override
  State<driverLogin> createState() => _driverLoginState();
}

class _driverLoginState extends State<driverLogin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email, password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => driverSelectOrder()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 36,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => driverMain()),
              );
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Input student email
                    Container(
                      width: 334,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "UPM Email",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.black, // input  text color
                          ),
                          validator: (val) => val!.isEmpty ? 'Enter a student email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                    ),

                    // Input Password
                    SizedBox(height: 10),
                    Container(
                      width: 334,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.black, // input  text color
                          ),
                          validator: (val) =>
                          val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                    ),

                    // Login Button
                    SizedBox(height: 20),
                    Container(
                      width: 334,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(119, 97, 255, 1.0),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            await signInWithEmailAndPassword();
                          }
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Forgot Password Button
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(119, 97, 255, 1.0),
                        ),
                      ),
                    ),

                    // Error message
                    SizedBox(height: 10),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
