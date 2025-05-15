import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.grey.shade300,
        child: Icon(icon, color: Colors.black54, size: 18),
      ),
    );
  }
}