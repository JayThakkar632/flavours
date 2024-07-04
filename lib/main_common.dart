import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';


Future<void> mainCommon() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String name = "started";

  @override
  void initState() {
    super.initState();

    config();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("From Remote Config : "+name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
    );
  }

  Future<void> config() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();

    name = remoteConfig.getString('name');

    setState(() {

    });
  }
}
