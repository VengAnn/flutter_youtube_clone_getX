import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/dimension.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.onTap,
    required this.icon,
    this.padding,
  });

  final VoidCallback onTap;
  final IconData icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? Dimensions.width5),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon),
      ),
    );
  }
}
