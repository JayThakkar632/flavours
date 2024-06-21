import 'package:flutter/material.dart';
import 'package:flutter_flavours/flavor_config.dart';
import 'package:flutter_flavours/main_common.dart';

void main(){
  final coffeeConfig=FlavorConfig()..appTitle="Coffee" ..imageLocation="assets/images/leaf.png"..themeColor=Colors.redAccent;
  mainCommon(coffeeConfig);
}