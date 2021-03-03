import 'package:Shop/app/controllers_models/product/base_product.dart';

class BaseCartItem {

  BaseProduct product;
  double quantity;
  BaseCartItem(
    this.product,
    this.quantity,
  );

  BaseCartItem.fromJson(Map<String,dynamic> jsonObject){
    this.product = BaseProduct.fromJson(jsonObject['product']);
    this.quantity = jsonObject['quantity'];
  }
  double discount(){}
}
