import 'dart:io';

import 'package:camera_app_gallery/Models/Image_model.dart';
import 'package:camera_app_gallery/screens/Gallery.dart';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class Home_screren extends StatefulWidget {
  const Home_screren({Key? key}) : super(key: key);

  @override
  State<Home_screren> createState() => _Home_screrenState();
}

class _Home_screrenState extends State<Home_screren> {
  String? imagePath;
  Box<ImageModel>? imageBox;

  @override
  void initState() {
    imageBox = Hive.box<ImageModel>('images');
    super.initState();
  }

  Future<void> AddImageToDatabase() async {
    if (imagePath == null) {
      print('THere occurs Some error while Adding Image to database');
      return;
    }
    final _image = ImageModel(imagePath: imagePath!);
    await imageBox!.add(_image);
    print('Image Successfully Added to database'); //for our sake
    //alertboxFunction add here......
    setState(() {
      imagePath = null;
    });
  }

  Future<void>CameraFunction()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image==null){
      return;
    }
    await GallerySaver.saveImage(image.path);
    setState(() {
      imagePath = image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 87, 102),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 102),
        title: Center(child: Text("SNAP CAM")),
        bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 6.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 10,
                      color: Color.fromARGB(255, 3, 87, 102),
                    ),
                  ),
                  child:(imagePath==null)?Image.asset("assets/img/dummyProfile.png"):Image.file(File(imagePath!)),
                  
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                    onPressed: () {
                      CameraFunction();
                      print('Image Added');
                      AddImageToDatabase();
                    },
                    icon: Icon(Icons.camera),
                    label: Text(
                      'Camrea',
                      style: TextStyle(fontSize: 20),
                    ))),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => GalleryScreen()));
                  },
                  icon: Icon(Icons.storage_outlined),
                  label: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
