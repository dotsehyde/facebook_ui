import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final User currentUser;

  const PostContainer({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Flexible(
                    child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: "What's happening?"),
                )),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => print("Video"),
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text(
                        "Video",
                        style: TextStyle(color: Colors.blue),
                      )),
                  const VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                      onPressed: () => print("Photos"),
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Photos",
                        style: TextStyle(color: Colors.blue),
                      )),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () => print("Room"),
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Room",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
