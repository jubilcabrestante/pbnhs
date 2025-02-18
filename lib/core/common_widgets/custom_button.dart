import 'package:flutter/material.dart';
import 'package:pbnhs/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // 👈 Wrap with MouseRegion to change cursor
      cursor: SystemMouseCursors.click, // 👈 Change cursor to hand pointer
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
