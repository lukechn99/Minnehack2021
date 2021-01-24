import 'package:flutter/material.dart';
import 'package:clean_homies/loc.dart';
import 'package:location/location.dart';
import 'package:workmanager/workmanager.dart';

void getLocation() async {
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
    getLocation();
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double latitude = 0;
  double longitude = 0;

  void _getLoc() async {
    Loc l = new Loc();
    LocationData data = l._getLocation();
    setState(() {
      latitude = data.latitude;
      longitude = data.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
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
