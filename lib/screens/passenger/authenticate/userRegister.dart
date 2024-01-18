import 'package:flutter/material.dart';
import 'package:putra_go/screens/passenger/authenticate/userRegisterSuccess.dart';

import '../../../services/auth.dart';
import '../../../models/user.dart';
import 'userRepository.dart';
import 'package:get/get.dart';
class userRegister extends StatefulWidget {
  @override
  State<userRegister> createState() => _userRegisterState();
}

class _userRegisterState extends State<userRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state

  String uid = '';
  String name = '';
  String email = '';
  String phoneNumber = '';
  String icNumber = '';
  String password = '';
  String passwordCheck = '';

  String error = '';
  bool loading = false;
  String successMessage = '';
  int InputFontsize = 15;

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
            Navigator.pop(context);
          },
        ),
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align at the top
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Input name
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) => val!.length < 4 ? 'Enter a name more than 3 chars' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),
                  ),

                  // Input UPM email
                  SizedBox(height: 20),
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
                          hintText: "UPM email",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) =>
                        val!.length < 4 ? 'Enter your UPM email' : null,
                        obscureText: false,
                        onChanged: (val) {
                          setState(() => email= val);
                        },
                      ),
                    ),
                  ),

                  // Input Phone Number
                  SizedBox(height: 20),
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
                          hintText: "Phone Number (11-, not 011-)",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) =>
                        val!.length != 10 ? 'Enter a valid phone number' : null,
                        obscureText: false,
                        onChanged: (val) {
                          setState(() => phoneNumber = val);
                        },
                      ),
                    ),
                  ),

                  // Input IC number
                  SizedBox(height: 20),
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
                          hintText: "IC Number / Passort Number",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) =>
                        val!.length <5  ? 'Enter a valid IC/Passport Number' : null,
                        obscureText: false,
                        onChanged: (val) {
                          setState(() => icNumber = val);
                        },
                      ),
                    ),
                  ),

                  // Input Password
                  SizedBox(height: 20),
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
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) =>
                        val!.length < 6 ? 'Enter a password > 6 chars long' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                  ),

                  // Check Password
                  SizedBox(height: 20),
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
                          hintText: "Password again",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          // fontSize: 20,
                          color: Colors.black, // input  text color
                        ),
                        validator: (val) {
                          if (val != password) {
                            return 'Passwords are different';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                  ),

                  // Register
                  SizedBox(height: 30),
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

                          // Create a User object with the form data
                          User user = User(
                            uid: uid, // You might want to generate a UID
                            name: name,
                            email: email,
                            phoneNumber: phoneNumber,
                            icNumber: icNumber,
                            password: password,
                            // role: ''
                          );

                          // Pass the user data to the UserRepository
                          // Get.find<UserRepository>().createUser(user);


                          dynamic result = await _auth.registerWithEmailAndPassword(user);

                        //   dynamic result = await _auth.registerWithEmailAndPassword(email, password, name, phoneNumber, icNumber);
                          if (result != null) {
                            // Registration successful
                            setState(() {
                              loading = false;
                              successMessage = 'Account successfully registered.';
                            });

                          } else {
                            // Registration failed
                            setState(() {
                              loading = false;
                              error = 'Registration failed. Please try again.';
                            });
                          }
                        }

                        // // Handle Next button press
                        // print(email);
                        // print(password);
                        // print(phoneNumber);


                        //
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => userRegisterSuccess()),
                        // );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),

            Text(
              successMessage,
              style: TextStyle(color: Colors.green, fontSize: 16.0),
            ),
            Text(
              _formKey.currentState?.validate() == false ? 'Please fix the errors above' : '',
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),

          ],
        ),
        )
      )

    );
  }
}
