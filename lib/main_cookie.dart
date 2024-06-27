import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options_cookie.dart';
import 'flavor_config.dart';
import 'main_common.dart';

Future<void> main() async {
  final cookieConfig = FlavorConfig()
    ..appTitle = "Cookie"
    ..imageLocation = "assets/images/logo.jpeg"
    ..themeColor = Colors.yellow;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  mainCommon(cookieConfig);
}
