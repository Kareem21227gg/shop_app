import 'package:Shop/app/controllers_models/category/base_category.dart';
import 'package:Shop/app/controllers_models/discount/base_discount.dart';
import 'package:Shop/app/controllers_models/image/base_image.dart';
import 'package:Shop/app/controllers_models/product_option/base_product_option.dart';
import 'package:Shop/app/controllers_models/tag/base_tag.dart';
import 'package:Shop/app/controllers_models/image/image_controller.dart';
import 'package:Shop/app/controllers_models/product_option/product_option_controller.dart';
import 'package:Shop/app/controllers_models/category/category_controller.dart';
import 'package:Shop/app/controllers_models/tag/tag_controller.dart';
import 'package:Shop/app/controllers_models/discount/discount_controller.dart';

 class BaseProduct {
  String id;
  String title;
  String description;
  double price;
  double quantity;
  List<BaseImage> images;
  List<BaseProductOption> options;
  List<BaseCategory> categorys;
  List<BaseTag> tags;
  List<BaseDiscount> discounts;
  BaseProduct({
    this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.images,
    this.options,
    this.categorys,
    this.tags,
    this.discounts,
  });

    BaseProduct.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.images = ImageController.toImages(jsonObject['images']);
    this.options = OptionController.toOptions(jsonObject['options']);
    this.categorys = CategoryController.toCategorys(jsonObject['categorys']);
    this.tags = TagController.toTags(jsonObject['tags']);
    this.discounts = DiscountController.toDiscounts(jsonObject['discounts']);
  }
}
