import 'package:camera_app_gallery/Models/Image_model.dart';
import 'package:camera_app_gallery/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void>main() async{
  await Hive.initFlutter();
   if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ImageModelAdapter());
  }
  await Hive.openBox<ImageModel>('images');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_screren(),

    );
  }
}