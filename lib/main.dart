import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          TextButton(
              onPressed: () async {
                await Permission.location.request().then((value) async {
                  final info = NetworkInfo();

                  final wifiName = await info.getWifiName(); // "FooNetwork"
                  final wifiBSSID =
                      await info.getWifiBSSID(); // 11:22:33:44:55:66
                  final wifiIP = await info.getWifiIP(); // 192.168.1.43
                  final wifiIPv6 = await info
                      .getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
                  final wifiSubmask =
                      await info.getWifiSubmask(); // 255.255.255.0
                  final wifiBroadcast =
                      await info.getWifiBroadcast(); // 192.168.1.255
                  final wifiGateway = await info.getWifiGatewayIP();

                  print(wifiBSSID);
                });
              },
              child: Text(
                "Press",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }
}
