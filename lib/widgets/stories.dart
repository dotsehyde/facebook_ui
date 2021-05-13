import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, this.currentUser, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _storyCard(isAddStory: true, currentUser: currentUser),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _storyCard(story: story),
            );
          }),
    );
  }
}

class _storyCard extends StatelessWidget {
  final User currentUser;
  final bool isAddStory;
  final Story story;

  const _storyCard({
    Key key,
    this.currentUser,
    this.isAddStory = false,
    this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: 110,
          ),
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: Palette.storyGradient),
          width: 110,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => print('Add Story'),
                    icon: Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                    ),
                  ))
              : ProfileAvatar(
                  imageUrl: story.user.imageUrl,
                  hasBorder: !story.isViewed,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? "Add to Story" : story.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
