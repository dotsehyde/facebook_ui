import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';

import '/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print("Search"),
              ),
              CircleButton(
                icon: Icons.message,
                iconSize: 30,
                onPressed: () => print("Message"),
              ),
            ],
            floating: true,
            title: Text(
              'Facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: PostContainer(
            currentUser: currentUser,
          )),
          SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: onlineUsers,
            ),
          ),
        ],
      ),
    );
  }
}
