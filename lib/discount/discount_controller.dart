import 'package:Shop/tag/base_tag.dart';

import 'base_discount.dart';

class DiscountController {

  BaseDiscount discount;
  DiscountController(
    this.discount,
  );
  
  static List<BaseDiscount> toDiscounts (List<Map<String,dynamic>> jsonObject){}
}
