// class OrderCust {
//   String name;
//   String email;
//   String phoneNumber;
//   String time;
//   String route;
//   String start;
//   int pax;
//   String price;
//
//   OrderCust({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.time,
//     required this.route,
//     required this.start,
//     required this.pax,
//     required this.price,
//   });
// }
//
// // Getters
// String get name => name;
// String get email => email;
// String get phoneNumber => phoneNumber;
// String get time => time;
// String get route => route;
// String get start => start;
// int get pax => pax;
// String get price => price;
//
// // Setters
// set name(String newName) {
//   name = newName;
// }
//
// set email(String newEmail) {
//   email = newEmail;
// }
//
// set phoneNumber(String newPhoneNumber) {
//   phoneNumber = newPhoneNumber;
// }
//
// set time(String newTime) {
//   time = newTime;
// }
//
// set route(String newRoute) {
//   route = newRoute;
// }
//
// set start(String newStart) {
//   start = newStart;
// }
//
// set pax(int newPax) {
//   pax = newPax;
// }
//
// set price(String newPrice) {
//   price = newPrice;
// }
//
// Map<String, dynamic> toJson() {
//   return {
//     "name": name,
//     "email": email,
//     "phoneNumber": phoneNumber,
//     "time": time,
//     "route": route,
//     "start": start,
//     "pax": pax,
//     "price": price,
//   };
// }
//


// Example list of orders
// List<Order> orders = [
//   Order(
//     name: 'Miki',
//     email: 'abc@gmail.com',
//     phoneNumber: '012-7202224',
//     time: '24-1-1 07:40 AM',
//     route: 'Within UPM',
//     start: 'FSKTM',
//     pax: 2,
//     price: '5',
//   ),
//
//   Order(
//     name: 'Aqil',
//     email:'2323@upm.com',
//     phoneNumber: '012-7202224',
//     time: '24-1-2 08:40 AM',
//     route: 'Within UPM',
//     start: 'K17',
//     pax: 2,
//     price: '5',
//   ),
//   // Add more orders here
// ];
// "role": role.toString(),
// Car information
// "carID": carID,
// "carBrand": carBrand,
// "carColor": carColor,
// class OrderCust {
//   String _name;
//   String _email;
//   String _phoneNumber;
//   String _time;
//   String _route;
//   String _start;
//   int _pax;
//   String _price;
//
//   OrderCust({
//     required String name,
//     required String email,
//     required String phoneNumber,
//     required String time,
//     required String route,
//     required String start,
//     required int pax,
//     required String price,
//   }) : _name = name,
//         _email = email,
//         _phoneNumber = phoneNumber,
//         _time = time,
//         _route = route,
//         _start = start,
//         _pax = pax,
//         _price = price;
//
//   // Getters
//   String get name => _name;
//   String get email => _email;
//   String get phoneNumber => _phoneNumber;
//   String get time => _time;
//   String get route => _route;
//   String get start => _start;
//   int get pax => _pax;
//   String get price => _price;
//
//   // Setters
//   set name(String newName) {
//     _name = newName;
//   }
//
//   set email(String newEmail) {
//     _email = newEmail;
//   }
//
//   set phoneNumber(String newPhoneNumber) {
//     _phoneNumber = newPhoneNumber;
//   }
//
//   set time(String newTime) {
//     _time = newTime;
//   }
//
//   set route(String newRoute) {
//     _route = newRoute;
//   }
//
//   set start(String newStart) {
//     _start = newStart;
//   }
//
//   set pax(int newPax) {
//     _pax = newPax;
//   }
//
//   set price(String newPrice) {
//     _price = newPrice;
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "name": _name,
//       "email": _email,
//       "phoneNumber": _phoneNumber,
//       "time": _time,
//       "route": _route,
//       "start": _start,
//       "pax": _pax,
//       "price": _price,
//     };
//   }
//
//   // Factory constructor for creating a new OrderCust instance from a map
//   factory OrderCust.fromMap(Map<String, dynamic> map) {
//     return OrderCust(
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       phoneNumber: map['phoneNumber'] ?? '',
//       time: map['time'] ?? '',
//       route: map['route'] ?? '',
//       start: map['start'] ?? '',
//       pax: map['pax'] ?? 0,
//       price: map['price'] ?? '',
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderCust {
  String _uid;
  String _name;
  String _email;
  String _phoneNumber;
  String _time;
  String _route;
  String _start;
  int _pax;
  String _price;

  OrderCust({

    required String uid,
    required String name,
    required String email,
    required String phoneNumber,
    required String time,
    required String route,
    required String start,
    required int pax,
    required String price,

  })  : _uid = uid,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _time = time,
        _route = route,
        _start = start,
        _pax = pax,
        _price = price;

  // Getters
  String get uid => _uid;
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get time => _time;
  String get route => _route;
  String get start => _start;
  int get pax => _pax;
  String get price => _price;

  // Setters
  set uid(String newUid) {
    _uid = newUid;
  }
  set name(String newName) {
    _name = newName;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set phoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
  }

  set time(String newTime) {
    _time = newTime;
  }

  set route(String newRoute) {
    _route = newRoute;
  }

  set start(String newStart) {
    _start = newStart;
  }

  set pax(int newPax) {
    _pax = newPax;
  }

  set price(String newPrice) {
    _price = newPrice;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "time": _time,
      "route": _route,
      "start": _start,
      "pax": _pax,
      "price": _price,
    };
  }

  // fromMap method
  factory OrderCust.fromMap(Map<String, dynamic> data) {
    return OrderCust(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      time: data['time'] ?? '',
      route: data['route'] ?? '',
      start: data['start'] ?? '',
      pax: data['pax'] ?? 0,
      price: data['price'] ?? '',
    );
  }

  static OrderCust fromDocumentSnapshot(DocumentSnapshot doc) {
    return OrderCust(
      uid: doc.id, // Use 'uid' instead of 'id'
      name: doc['name'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
      time: doc['time'],
      route: doc['route'],
      start: doc['start'],
      pax: doc['pax'],
      price: doc['price'],
    );
  }

}
