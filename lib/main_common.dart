import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavours/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


var flavourConfigProvider;

Future<void> mainCommon(FlavorConfig config) async {

  flavourConfigProvider = StateProvider(
      (ref)=>config,
  );
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
  String name = "started";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    config();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read(flavourConfigProvider).state.appTitle),
        backgroundColor: context.read(flavourConfigProvider).state.themeColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            context.read(flavourConfigProvider).state.imageLocation,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20,),
          Text(name)
        ],
      ),
    );
  }

  Future<void> config() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    name = remoteConfig.getString('name');

    setState(() {

    });
  }
}
