import 'package:pbnhs/core/enum/user_roles.dart';

class UserRoles {
  static const Map<UserRole, String> roleNames = {
    UserRole.superAdmin: "Super-Admin",
    UserRole.teacher: "teacher",
  };

  /// Get role name as a string
  static String getRoleName(UserRole role) {
    return roleNames[role] ?? "Unknown";
  }

  /// Check if a role has superAdministrative privileges
  static bool issuperAdmin(UserRole role) {
    return role == UserRole.superAdmin;
  }

  /// Check if a role is a teacher
  static bool isteacher(UserRole role) {
    return role == UserRole.teacher;
  }
}
