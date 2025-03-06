import 'package:pbnhs/core/enum/user_roles.dart';

class UserRoles {
  static final Map<UserRole, String> roleNames = {
    UserRole.superAdmin: "super-admin",
    UserRole.admin: "admin",
  };

  /// Get role name as a string
  static String getRoleName(UserRole role) {
    return roleNames[role] ?? "Unknown";
  }

  /// Check if a role has superAdministrative privileges
  static bool isSuperAdmin(UserRole role) {
    return role == UserRole.superAdmin;
  }

  /// Check if a role is a admin
  static bool isadmin(UserRole role) {
    return role == UserRole.admin;
  }
}
