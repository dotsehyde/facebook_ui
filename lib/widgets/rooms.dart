import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.white,
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
