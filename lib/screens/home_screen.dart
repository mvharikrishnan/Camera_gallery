import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home_screren extends StatelessWidget {
  const Home_screren({Key? key}) : super(key: key);

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
          children: [
            Container(
              height: 50,
              width: 200,
              color: Colors.white,
              child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.camera), label: Text('Camrea'))
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 200,
              color:Colors.white,
              child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.storage_outlined), label: Text('Gallery'))
            ),
          ],
        ),
      ),
    );
  }
}
