import 'package:Shop/app/controllers_models/user/user.dart';

class Authenticatable{

  Future<User> register(String email , String passWord){}

  Future<bool> login (String email , String passwod){}

  Future<bool> resetPassword (String email){}

  Future<User> updateProfile(User user){}
  
}