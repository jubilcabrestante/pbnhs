enum UserRole { admin, superAdmin }

extension UserRoleExtension on UserRole {
  static UserRole? fromString(String role) {
    switch (role) {
      case 'super-admin':
        return UserRole.superAdmin;
      case 'admin': // Corrected
        return UserRole.admin;
      default:
        return null; // Handle unknown roles gracefully
    }
  }
}
