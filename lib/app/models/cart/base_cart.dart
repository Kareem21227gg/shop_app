import 'package:Shop/app/models/product/base_product.dart';
import 'package:Shop/app/models/user/customer.dart';
class BaseCart {
List<BaseProduct> products;
Customer customer;
double totalPrice;

BaseCart(this.customer,this.products){
  totalPrice = getTotalPrice();
}

double getTotalPrice(){
  double x=0;
  for(BaseProduct product in products ){
    x+= product.price;
  }
  return x;
}
}
