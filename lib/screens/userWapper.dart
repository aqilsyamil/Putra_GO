import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:putra_go/screens/passenger/authenticate/authenticate.dart';
import 'package:putra_go/screens/passenger/userHome/userCustomizedOrder.dart';

import '../models/user.dart';

class userWapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return userCustomizedOrder();
    }

  }
}