import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/models/user_model.dart';

class _Define {
  var user;
}

class UserController extends GetxController with _Define {
  initUser(UserModel user) {
    this.user = Rx<UserModel>(user);
  }

  changeName(String name) => user.value.name = name;
  changeEmail(String email) => user.value.email = email;
  changePassword(String password) => user.value.password;
}
