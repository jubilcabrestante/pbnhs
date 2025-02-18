enum UserRole { teacher, superAdmin }

extension UserRoleExtension on UserRole {
  static UserRole? fromString(String role) {
    switch (role) {
      case 'super-admin':
        return UserRole.superAdmin;
      case 'teacher':
        return UserRole.teacher;
      default:
        return null; // Return null for unknown roles
    }
  }

  String toShortString() {
    return toString().split('.').last;
  }
}
