import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:putra_go/services/auth.dart';
import 'firebase_options.dart';
import 'models/user.dart';
import 'screens/passenger/userMain.dart';
import 'screens/passenger/authenticate/userRepository.dart';
import 'package:get/get.dart';

main() async {
  runApp(MaterialApp(home: userMain(), debugShowCheckedModeBanner: false));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}