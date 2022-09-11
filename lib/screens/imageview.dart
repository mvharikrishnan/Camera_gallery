import 'dart:io';

import 'package:camera_app_gallery/Models/Image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({
    
    super.key,
    required this.imageModel,
  })  ;
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 87, 102),
      appBar: AppBar(
        title: Text('IMAGE VIEW'),
        backgroundColor: Color.fromARGB(255, 3, 87, 102),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 6.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 10),
          
          ),
          child: Image.file(File(imageModel.imagePath)),
        ),
      ),
    );
  }
}
