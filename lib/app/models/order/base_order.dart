import 'package:Shop/app/models/cart/base_cart.dart';
import 'package:Shop/app/models/user/customer.dart';

class BaseOrder {
  BaseCart cart;
  Customer customer;
  BaseOrder(
    this.cart,
    this.customer,
  );

  BaseOrder.fromJson(Map<String, dynamic> jsonObject) {
    // this.cart = BaseCart.fromJson(jsonObject['cart']);
    this.customer = Customer.fromJson(jsonObject['customer']);
  }

  double total() {}
}
