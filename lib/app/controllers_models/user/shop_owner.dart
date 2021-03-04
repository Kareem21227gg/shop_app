import 'my_user.dart';

class ShopOwner extends MyUser {
  ShopOwner(
      {String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender})
      : super(id, firstName, lastName, email, phone, gender);
}
