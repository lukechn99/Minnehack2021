import 'package:workmanager/workmanager.dart';
import 'package:location/location.dart';

const myTask = "syncWithTheBackEnd";

void main() {
  Workmanager.initialize(callbackDispatcher);
  Workmanager.registerOneOffTask(
    "1",
    myTask, //This is the value that will be returned in the callbackDispatcher
    initialDelay: Duration(minutes: 5),
    constraints: WorkManagerConstraintConfig(
      requiresCharging: true,
      networkType: NetworkType.connected,
    ),
  );
  runApp(MyApp());
}

/*
 * Important for background tasks. The 
 * 
 */
void callbackDispatcher() {
  Workmanager.executeTask((task) {
    switch (task) {
      case myTask:
        print("this method was called from native!");
        break;
      case Workmanager.iOSBackgroundTask:
        print("iOS background fetch delegate ran");
        break;
    }

    //Return true when the task executed successfully or not
    return Future.value(true);
  });
}

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
