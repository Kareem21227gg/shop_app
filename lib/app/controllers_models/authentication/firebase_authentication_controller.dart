import 'package:Shop/app/controllers_models/user/user.dart';
import 'authenticatable.dart';

class FirebaseAuthenticationController implements Authenticatable{
  @override
  Future<bool> login(String email, String passwod) {
      // TODO: implement login
      throw UnimplementedError();
    }
  
    @override
    Future<User> register(String email, String passWord) {
      // TODO: implement register
      throw UnimplementedError();
    }
  
    @override
    Future<bool> resetPassword(String email) {
      // TODO: implement resetPassword
      throw UnimplementedError();
    }
  
    @override
    Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

} 