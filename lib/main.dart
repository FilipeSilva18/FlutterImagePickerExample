import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste Image Picker",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste Image Picker"),
        ),
        body: Center(
          child: _image == null
              ? Text("Nenhuma imagem selecionada")
              : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: "Picker Image",
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
