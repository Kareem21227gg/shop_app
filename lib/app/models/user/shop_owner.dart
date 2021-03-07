import 'my_user.dart';

class ShopOwner extends MyUser {
  ShopOwner(
      {String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender})
      : super( id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            gender: gender,
            phone: phone);
}
