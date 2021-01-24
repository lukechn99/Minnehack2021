import 'package:flutter/material.dart';
// makes file and directory available
import 'dart:io';
// makes maps available
import 'dart:convert';
// provides path where we will store JSON file
import 'package:path_provider/path_provider.dart';
import 'package:location/location.dart';

const String filename = 'storage.json';

class Storage extends StatefulWidget {
  @override
  State createState() {
    return new Datastore();
  }
}

/* This class will store data like trips, 
 * For a trip, the key will be "trip" and its value will be a JSON of duration,
 * distance, origin, destination, 
 */
class Datastore extends State<Storage> {
  File jsonFile;
  Directory dir;
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  TextEditingController key = new TextEditingController();
  TextEditingController value = new TextEditingController();

  // errors
  @override
  Widget build(BuildContext context) {}

  // overrides default initstate
  @override
  void initState() {
    super.initState();
    // then means that it will happen when its available
    // we get the permanent directory
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + filename);
      // synchronous "exists" means that we will wait for this to finish before
      // moving on
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(() {
          fileContent = jsonDecode(jsonFile.readAsStringSync());
        });
    });
  }

  void createFile(
      Map<String, dynamic> content, Directory dir, String fileName) {
    print("Create");
    File file = new File(dir.path + "/" + filename);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(jsonEncode(content));
  }

  void writeToFile(String key, dynamic value, Directory dir, String fileName) {
    print("writing");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      // access what's already stored
      Map<String, dynamic> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      // add the new content
      jsonFileContent.addAll(content);
      // write the full content back
      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
    } else {
      // file does not exist, so create file
      createFile(content, dir, fileName);
    }
  }

  void logTrip(Location location) {}
}

/*
 * This class will initialize a store of random health and handwashing facts.
 * It should be initialized with the homepage of the app, and is accessed 
 * whenever a fact banner is needed. 
 */
class Factstore {}
