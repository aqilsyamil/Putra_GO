// import 'package:flutter/material.dart';
//
// import 'driverFinishOrder.dart';
// import 'driverSelectOrder.dart';
//
// class driverPickup extends StatelessWidget {
//   // Assuming you have a method to fetch order details from the database.
//   // final Order order = fetchOrderFromDatabase();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child:  SingleChildScrollView(
//         child:
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//
//             SizedBox(height: 20),
//             Image.asset(
//               'assets/images/successImage.png',
//               height: 140,
//               width: 140,
//             ),
//
//             SizedBox(height: 5),
//             Text(
//               'This order successfully created!',
//               style:
//                   TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//             ),
//             // Your checkmark image will be placed here
//             Card(
//               margin: const EdgeInsets.symmetric(vertical: 20.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text('07:40 PM'),
//                         Text('Monday'),
//                       ],
//                     ),
//                     Divider(),
//                     ListTile(
//                       title: Text('Name:'),
//                       subtitle: Text('Mu Shuang'), // Replace with dynamic data
//                     ),
//                     ListTile(
//                       title: Text('Route:'),
//                       subtitle: Text('Within UPM'), // Replace with dynamic data
//                     ),
//                     ListTile(
//                       title: Text('Start:'),
//                       subtitle: Text('FSKTM'), // Replace with dynamic data
//                     ),
//                     ListTile(
//                       title: Text('More than 4:'),
//                       subtitle: Text('Yes'), // Replace with dynamic data
//                     ),
//                     ListTile(
//                       title: Text('Tel:'),
//                       subtitle: Text('1129991444'), // Replace with dynamic data
//                     ),
//                     ListTile(
//                       title: Text('Price:'),
//                       subtitle: Text('RM 5'),
// // Replace with dynamic data
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary:Color.fromRGBO(119, 97, 255, 1.0) , // background
//                 onPrimary: Colors.white, // foreground
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => driverFinishOrder()),
//                 );
//               },
//               child: Text('Finish Ride'),
//             ),
//
//             SizedBox(height: 10),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary:Color.fromRGBO(255, 120, 116, 1) , // background
//                 onPrimary: Colors.white, // foreground
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => driverSelectOrder()),
//                 );
//               },
//               child: Text('Cancel'),
//             ),
//
//           ],
//         ),
//         )
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'driverFinishOrder.dart';
import 'driverSelectOrder.dart';
import '../../../models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class driverPickup extends StatelessWidget {
  // Assuming you have a method to fetch order details from the database.
  // final Order order = fetchOrderFromDatabase();
  final OrderCust order;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  driverPickup({required this.order});


  Future<void> finishRide(BuildContext context) async {
    try {
      await firestore.collection('orders').doc(order.uid).delete();
      // After deleting the order, navigate back to the order selection screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => driverFinishOrder()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      print("Error deleting order: $e");
      // Optionally, show an error message to the user
    }
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/successImage.png',
                    height: 140,
                    width: 140,
                  ),

                  SizedBox(height: 5),
                  Text(
                    'This order successfully created!',
                    style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  // Your checkmark image will be placed here
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            ],
                          ),
                          Divider(),
                          // Display name
                          ListTile(
                            title: Text('Name:'),
                            subtitle: Text(order.name),
                          ),

                          // Display route
                          ListTile(
                            title: Text('Route:'),
                            subtitle: Text(order.route),
                          ),

                          // Display start location
                          ListTile(
                            title: Text('Start:'),
                            subtitle: Text(order.start),
                          ),

                          // Display number of passengers (pax)
                          ListTile(
                            title: Text('Pax:'),
                            subtitle: Text('${order.pax}'),
                          ),

                          // Display phone number
                          ListTile(
                            title: Text('Tel:'),
                            subtitle: Text(order.phoneNumber),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(119, 97, 255, 1.0), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => driverFinishOrder()),
                      );
                    },
                    child: Text('Finish Ride'),
                  ),

                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 120, 116, 1), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => driverSelectOrder()),
                      );
                    },
                    child: Text('Cancel'),
                  ),

                ],
              ),
            )
        ),
      );
    }
  }
