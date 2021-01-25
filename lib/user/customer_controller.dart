import 'package:Shop/order/base_order.dart';
import 'package:Shop/product/base_product.dart';
import 'customer.dart';

class CustomerController {

 Customer customer;
  CustomerController(
    this.customer,
  );
  
  
  void addToOrders(BaseOrder order) {
    customer.orders.add(order);
  }

  void addToProducts(BaseProduct product) {
    customer.products.add(product);
  }

  bool orderInOrders(BaseOrder order) {
    return customer.orders.contains(order);
  }

  bool productInProducts(BaseProduct product) {
    return customer.products.contains(product);
  }

  //TODO:add remove function
}
