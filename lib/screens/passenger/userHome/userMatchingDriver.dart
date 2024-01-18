import 'package:flutter/material.dart';
import 'package:putra_go/screens/passenger/userHome/userCustomizedOrder.dart';

import '../../driver/driverLogin.dart';


class userMatchingDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'Looking for driver to accept..',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),

            Text(
              'Do no worry,',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),

            Text(
              'It needs some time~',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),

            SizedBox(height: 10),
            Image.asset(
              'assets/images/matchingLogo.png',
              height: 170,
              width: 170,
            ),

            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child:
              Container(
                width: 334,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(255, 120, 116, 1),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userCustomizedOrder()),
                    );
                  },
                  child: Text(
                    'Cancel this order',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
