enum EnumAction { add, update, delete }

extension EnumActionExtension on EnumAction {
  String get name {
    switch (this) {
      case EnumAction.add:
        return 'Add';
      case EnumAction.update:
        return 'Update';
      case EnumAction.delete:
        return 'Delete';
    }
  }
}
