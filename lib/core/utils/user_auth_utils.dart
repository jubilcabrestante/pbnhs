import '../models/user_auth/user_auth_model.dart';

class UserAuthUtils {
  static String getRole(UserAuthModel authModel) {
    return authModel.user.role;
  }

  static bool isSuperAdmin(UserAuthModel authModel) {
    return authModel.user.role == "Super-Admin";
  }
}
