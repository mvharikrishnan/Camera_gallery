import 'package:flutter/material.dart';
 

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      
    );
  }
}
