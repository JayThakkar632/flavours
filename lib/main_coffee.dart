import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavours/main_common.dart';
import 'firebase_options_coffee.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: "coffee", options: DefaultFirebaseOptions.currentPlatform);
  mainCommon();
}
