import 'package:Shop/app/controllers_models/category/base_category.dart';

import 'base_tag.dart';

class TagController {

  BaseTag tag;
  TagController(
    this.tag,
  );

  static List<BaseTag> toTags (List<Map<String,dynamic>> jsonObject){}


}
