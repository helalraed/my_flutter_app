import 'package:flutter/material.dart';

enum ButtonType { text, icon }

class SharedMainButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  final TextStyle? labelStyle;

  const SharedMainButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.text,
    this.icon,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xFFE43C3E), // أحمر
      ),
      child: type == ButtonType.icon && icon != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: labelStyle ?? const TextStyle(color: Colors.white)),
        ],
      )
          : Text(label, style: labelStyle ?? const TextStyle(color: Colors.white)),
    );
  }
}

class SharedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double size;

  const SharedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFF4F4F4),
    this.size = 44,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: size * 0.6, color: Colors.black),
        ),
      ),
    );
  }
}
