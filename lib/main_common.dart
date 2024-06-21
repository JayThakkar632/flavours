import 'package:flutter/material.dart';
import 'package:flutter_flavours/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


var flavourConfigProvider;

void mainCommon(FlavorConfig config) {
  flavourConfigProvider = StateProvider(
      (ref)=>config,
  );
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.read(flavourConfigProvider).state.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read(flavourConfigProvider).state.appTitle),
        backgroundColor: context.read(flavourConfigProvider).state.themeColor),
      body: Image.asset(
        context.read(flavourConfigProvider).state.imageLocation,
        fit: BoxFit.cover,
      ),
    );
  }
}
