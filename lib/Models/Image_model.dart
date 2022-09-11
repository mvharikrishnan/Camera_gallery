import 'package:hive_flutter/adapters.dart';
 part 'Image_model.g.dart';
@HiveType(typeId: 0)
class ImageModel extends HiveObject{
  @HiveField(0)
  String imagePath;
  ImageModel({required this.imagePath});
}