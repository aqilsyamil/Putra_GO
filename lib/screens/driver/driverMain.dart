import 'package:flutter/material.dart';
import '../passenger/userMain.dart';
import 'driverLogin.dart';
import 'driverRegister.dart';

class driverMain extends StatefulWidget {
  @override
  State<driverMain> createState() => _driverMainState();
}

class _driverMainState extends State<driverMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Column(
          children: [

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
                      'Make daily trips',
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
                      'Maximize earnings',
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

                  //Go to Login page
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => driverLogin()),
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

                  //Go to register page
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
                          MaterialPageRoute(builder: (context) => driverRegister()),
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
                      // Handle login as a driver button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => userMain()),
                      );
                    },
                    child: Text(
                      'Login as a User',
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