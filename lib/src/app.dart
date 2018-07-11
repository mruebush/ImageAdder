import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return AppState();
    }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    print('getting photo $counter');
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel); 
    });  
  }

  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        home: new Scaffold(
          appBar: AppBar(
            title: Text("Let's see some images"),
          ),
          body: ImageList(images),
          floatingActionButton: new FloatingActionButton(
            child: Icon(
                Icons.add,
                size: 50.0,
              ),
            onPressed: fetchImage,
          ),
        ),
    );
  }
}