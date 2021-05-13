import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;
  final int selectedIndex;
  final Function onTap;

  const CustomAppBar({
    Key key,
    this.currentUser,
    this.icon,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ]),
      child: Row(
        children: [
          Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Container(
            width: 600,
            child: CustomTabBar(
              icons: icon,
              onTap: onTap,
              selectedIndex: selectedIndex,
            ),
          )
        ],
      ),
    );
  }
}
