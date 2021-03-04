import 'my_user.dart';
import 'address.dart';
import 'package:Shop/app/controllers_models/order/base_order.dart';
import 'package:Shop/app/controllers_models/product/base_product.dart';
import 'package:Shop/app/controllers_models/product/product_controller.dart';
import 'package:Shop/app/controllers_models/order/order_controller.dart';

class Customer extends MyUser {
  List<BaseOrder> orders;
  List<BaseProduct> products;
  Address shippingAddress;
  Address billingAddress;

  Customer({
    String id,
    String firstName,
    String lastName,
    String email,
    String phone,
    String gender,
    Address shippingAddress,
    Address pillingAddress,
    List<BaseOrder> orders,
    List<BaseProduct> products,
  }) : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = pillingAddress;
    this.orders = orders;
    this.products = products;
  }

  Customer.fromJson(Map<String, dynamic> jsonObject)
      : super(
          jsonObject['id'],
          jsonObject['first_name'],
          jsonObject['last_name'],
          jsonObject['email'],
          jsonObject['phone'],
          jsonObject['gender'],
        ) {
          this.shippingAddress =  Address.fromJson(jsonObject['shipping_address']);
          this.billingAddress = Address.fromJson(jsonObject['billing_address']);
          this.products=ProductController.toProducts(jsonObject['products']);
          this.orders = OrderController.toOrders(jsonObject['orders']);
        }
}
