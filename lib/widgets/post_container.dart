import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final User currentUser;

  const PostContainer({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
            Flexible(
                child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: "What's happening?"),
            )),
          ],
        ),
        const Divider(
          height: 80,
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () => print("Video"),
                icon: Icon(
                  Icons.video_camera_back,
                  color: Colors.red,
                ),
                label: Text(
                  "Video",
                  style: TextStyle(color: Colors.blue),
                )),
            const VerticalDivider(
              width: 80,
              thickness: 2,
            ),
            TextButton.icon(
                onPressed: () => print("Photos"),
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label: Text(
                  "Photos",
                  style: TextStyle(color: Colors.blue),
                )),
            const VerticalDivider(
              width: 80,
              thickness: 2,
            ),
            TextButton.icon(
                onPressed: () => print("Room"),
                icon: Icon(
                  Icons.video_call,
                  color: Colors.purple,
                ),
                label: Text(
                  "Room",
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        )
      ],
    );
  }
}
