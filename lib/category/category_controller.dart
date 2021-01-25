import 'base_category.dart';

class CategoryController {

  BaseCategory category;
  CategoryController(
    this.category,
  );

  static List<BaseCategory> toCategorys (List<Map<String,dynamic>> jsonObject){}

}
