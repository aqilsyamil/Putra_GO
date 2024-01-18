import 'package:flutter/material.dart';
import '../userMain.dart';

class userOrderCancelled extends StatelessWidget {
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
              'Opps..',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Your driver cancelled this order',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),
            SizedBox(height: 70),

            Align(
              alignment: Alignment.center,
              child:
              Container(
                width: 334,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(119, 97, 255, 1.0),
                ),
                child: TextButton(
                  onPressed: () {
                    // Handle Next button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userMain()),
                    );
                  },
                  child: Text(
                    'Back to main page',
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
