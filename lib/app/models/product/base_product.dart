import 'package:Shop/app/models/category/base_category.dart';
import 'package:Shop/app/models/image/base_image.dart';
import 'package:Shop/app/models/tag/base_tag.dart';

 class BaseProduct {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  BaseImage image;
  BaseCategory category;
  List<BaseTag> tags;
  BaseProduct({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.category,
    this.tags,
  });

    BaseProduct.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.imageUrl = jsonObject['imageUrl'];
   // this.image = BaseImage.fromJson(jsonObject['image']);
    // this.category = BaseCategory.fromJson(jsonObject['categorys']);
    // List<Map<String, dynamic>> listMapTag = jsonObject['tags'];
    // this.tags = listMapTag.map((Map<String, dynamic>  jsonTag)=> BaseTag.fromJson(jsonTag)).toList();
  }
}
