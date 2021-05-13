import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Responsive(
          mobile: _HomePageMobile(scrollController: _trackingScrollController),
          desktop:
              _HomePageDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomePageMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomePageMobile({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () => print("Search"),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () => print("Message"),
            ),
          ],
          backgroundColor: Colors.white,
          floating: false,
          title: Text(
            'facebook',
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
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5, 0),
          sliver: SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: onlineUsers,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5, 0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostList(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomePageDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomePageDesktop({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10, 0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              SliverToBoxAdapter(
                  child: PostContainer(
                currentUser: currentUser,
              )),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5, 0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    onlineUsers: onlineUsers,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostList(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ContactList(users: onlineUsers),
            )),
      ],
    );
  }
}
