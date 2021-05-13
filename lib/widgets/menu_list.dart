import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'widgets.dart';

class MenuList extends StatelessWidget {
  final List<List> _moreoptions = const [
    [MdiIcons.shieldAccount, Colors.purple, "COVID-19 Info Center"],
    [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messager"],
    [MdiIcons.flag, Colors.orange, "Pages"],
    [MdiIcons.storefront, Palette.facebookBlue, "Maketplace"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [MdiIcons.calendarStar, Colors.red, "Events"]
  ];
  final User currentUser;

  MenuList({Key key, this.currentUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 280),
        child: ListView.builder(
            itemCount: 1 + _moreoptions.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      ProfileAvatar(imageUrl: currentUser.imageUrl),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          currentUser.name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                );
              }
              final List option = _moreoptions[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _options(
                  icon: option[0],
                  color: option[1],
                  label: option[2],
                ),
              );
            }));
  }
}

class _options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _options({
    Key key,
    this.icon,
    this.color,
    this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 36,
            color: color,
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
              child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600),
            // overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
