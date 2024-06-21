import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main_common.dart';

void main(){
  final cookieConfig=FlavorConfig()..appTitle="Cookie" ..imageLocation="assets/images/logo.jpeg"..themeColor=Colors.yellow;
  mainCommon(cookieConfig);
}