import 'package:Shop/app/models/cart/base_cart.dart';

import 'my_user.dart';
import 'package:Shop/app/models/order/base_order.dart';
import 'package:Shop/app/models/product/base_product.dart';

class Customer extends MyUser {
  BaseCart cart;
  Customer(
      {String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender,
      BaseCart cart})
      : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            gender: gender,
            phone: phone);

  Customer.fromJson(Map<String, dynamic> jsonObject)
      : super(
          id: jsonObject['id'],
          firstName: jsonObject['first_name'],
          lastName: jsonObject['last_name'],
          email: jsonObject['email'],
          gender: jsonObject['gender'],
          phone: jsonObject['phone'],
        ) {
          this.cart = jsonObject['cart'];//ToDo: handel the json cart object
        }
}
