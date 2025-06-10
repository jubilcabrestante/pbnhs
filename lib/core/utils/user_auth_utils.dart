import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

class UserAuthUtils {
  static String getRole(UserVm user) {
    return user.role;
  }

  static bool isSuperAdmin(UserVm user) {
    return user.role == "Super-Admin";
  }
}
