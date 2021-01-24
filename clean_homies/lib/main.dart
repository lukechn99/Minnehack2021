import 'package:flutter/material.dart';
import 'package:clean_homies/loc.dart';
import 'package:location/location.dart';
import 'package:workmanager/workmanager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void sendNotification() async {
  LocationData currentLocation;
  var location = new Location();
  try {
    currentLocation = await location.getLocation();
  } on Exception catch (e) {
    print("Error obtaining location: $e");
    currentLocation = null;
  }
  print("Location altitude: ${currentLocation.altitude}");
  print("Location longitude: ${currentLocation.longitude}");
}

void callbackDispatcher() {
  Workmanager.executeTask((task, input) async {
    sendNotification();
    return Future.value(true);
  });
}

void main() {
  Workmanager.initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager.registerOneOffTask("1", "simpleTask"); //Android only

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  runApp(MyApp());
}

// background tasks: https://medium.com/vrt-digital-studio/flutter-workmanager-81e0cfbd6f6e

// This widget is the root of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Homies',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue[300],
        brightness: Brightness.light,
      ),
      home: MyHomePage(title: 'Clean Hands'),
    );
  }
}

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String messageTitle = "Empty";
  final String notificationAlert = "alert";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double latitude = 0;
  double longitude = 0;

  void _getLoc() async {
    Loc l;
    LocationData data;
    // await l._getLocation().then(data);
    setState(() {
      latitude = data.latitude;
      longitude = data.longitude;
    });
  }

  // rerun by setState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$latitude',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$longitude',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLoc,
        tooltip: 'Update Location',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
