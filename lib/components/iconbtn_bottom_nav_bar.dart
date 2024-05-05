import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/constant_color.dart';
import 'package:youtube_clone/utils/dimension.dart';

enum TypeBottomNavBar {
  normal,
  circleAvatar,
  normalCircle,
  // Add more types as needed
}

class IconButtonBottonNavBar extends StatelessWidget {
  const IconButtonBottonNavBar({
    super.key,
    required this.onTap,
    required this.icon,
    this.text,
    required this.colorText,
    required this.typeBottomNavBar,
    this.radius,
    this.colorBorder = ConstantColor.colorBlack,
  });

  final IconData icon;
  final String? text;
  final Color colorText;
  final VoidCallback onTap;
  final TypeBottomNavBar typeBottomNavBar;
  final double? radius;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    switch (typeBottomNavBar) {
      case TypeBottomNavBar.normal:
        return _buildNormalIconButton(
          icon: icon,
          text: text!,
          colorText: colorText,
          onTap: onTap,
        );
      case TypeBottomNavBar.circleAvatar:
        return _buildCircleAvatarIconButton(
          onTap: onTap,
          radius: radius ?? Dimensions.radius15,
          text: text!,
          colorText: colorText,
          icon: icon,
        );
      case TypeBottomNavBar.normalCircle:
        return _buildCircleNormal(
          onTap: onTap,
          colorBorder: colorBorder,
          icon: icon,
        );
    }
  }
}

Widget _buildCircleNormal({
  required Color colorBorder,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Dimensions.width20 * 1.5,
      height: Dimensions.height20 * 1.5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: colorBorder,
        ),
      ),
      child: Icon(icon),
    ),
  );
}

Widget _buildNormalIconButton({
  required IconData icon,
  required String text,
  required Color colorText,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Text(
          text,
          style: TextStyle(
            color: colorText,
          ),
        ),
      ],
    ),
  );
}

Widget _buildCircleAvatarIconButton({
  required VoidCallback onTap,
  required double radius,
  required String text,
  required Color colorText,
  required IconData icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: radius, // Adjust radius as needed
          child: Icon(icon),
        ),
        Text(
          text,
          style: TextStyle(
            color: colorText,
          ),
        ),
      ],
    ),
  );
}
