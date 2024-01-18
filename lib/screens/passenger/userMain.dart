import 'package:flutter/material.dart';
import '../driver/driverMain.dart';
import 'authenticate/userLogin.dart';
import 'authenticate/userRegister.dart';

class userMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Share the ride',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Split the fare',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  Image.asset(
                    'assets/images/putrago.png',
                    height: 70,
                  ),
                  SizedBox(height: 70),
                  Container(
                    width: 334,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(119, 97, 255, 1.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Handle login button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => userLogin()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  //Go to user register page
                  SizedBox(height: 10),
                  Container(
                    width: 334,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Handle register button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => userRegister()),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20),
                  Text(
                    'or',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(165, 165, 165, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Handle login as a user button press
                      Navigator.push(                  context,
                        MaterialPageRoute(builder: (context) => driverMain()),
                      );
                    },
                    child: Text(
                      'Login as a Driver',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(119, 97, 255, 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )

    );
  }
}