import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZKorea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'EZKorea Home Page',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    permission();
    return WebviewScaffold(
      url: 'https://ezkorea.net',
      scrollBar: false,
      appBar: PreferredSize(child: Container(color: Colors.black), preferredSize: Size.fromHeight(0.0)),
    );
  }
}

Future<bool> permission() async {
  Map<Permission, PermissionStatus> status =
  await [Permission.location, Permission.storage, Permission.camera].request(); // [] 권한배열에 권한을 작성

  if (await Permission.camera.isGranted &&
      await Permission.storage.isGranted &&
      await Permission.location.isGranted) {
    return Future.value(true);
  } else {
    return Future.value(false);
  }
}