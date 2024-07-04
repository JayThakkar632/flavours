import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavours/flavor_config.dart';
import 'package:flutter_flavours/main_common.dart';

  import 'firebase_options_coffee.dart';

Future<void> main() async {
  final coffeeConfig=FlavorConfig()..appTitle="Coffee" ..imageLocation="assets/images/leaf.png"..themeColor=Colors.redAccent;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  mainCommon(coffeeConfig);
}