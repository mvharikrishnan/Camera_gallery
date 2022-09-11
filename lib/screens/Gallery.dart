import 'dart:io';

import 'package:camera_app_gallery/Models/Image_model.dart';
import 'package:camera_app_gallery/screens/imageview.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Box<ImageModel>? imageBox;
  @override
  void initState() {
    imageBox = Hive.box<ImageModel>('images');
    super.initState();
  }

  DeleteAlertBox(BuildContext context, int key) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text('Do you want to Delete this Image?'),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await imageBox!.delete(key);
                  Navigator.pop(context);
                },
                child: Text('YES'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('NO'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 87, 102),
      appBar: AppBar(
        title: Text('GALLERY'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 87, 102),
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
        child: ValueListenableBuilder(
            valueListenable: imageBox!.listenable(),
            builder:
                (BuildContext context, Box<ImageModel> images, Widget? child) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  final key = images.keys.toList()[index];
                  final _image = images.get(key);
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ImageViewScreen(imageModel:_image!),
                        ),
                      );
                    },
                    onLongPress: () => DeleteAlertBox(context, key),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 10)),
                      child: ClipRect(
                        child: Image(
                          image: FileImage(
                            File(_image!.imagePath),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: images.length,
              );
            }),
      ),
    );
  }
}
