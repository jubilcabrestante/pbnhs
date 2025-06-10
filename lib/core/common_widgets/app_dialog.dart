import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showModal({
    required BuildContext context,
    required Widget child,
    bool dismissible = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: dismissible,
      enableDrag: dismissible,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter, // 👈 Positions it at the top
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
