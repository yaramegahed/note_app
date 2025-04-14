import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.arrowIcon,
    this.onPressed,
    this.showBackButton = true,
  });

  final String title;
  final IconData icon;
  final IconData? arrowIcon;
  final void Function()? onPressed;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              color: Colors.white,
              onPressed: onPressed,
              icon: Icon(arrowIcon),
            )
          : null,
      backgroundColor: Color(0xFF7D91FA),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFFF8383)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
            letterSpacing: 2),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
