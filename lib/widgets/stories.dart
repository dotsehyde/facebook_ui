import 'package:facebook_ui/models/models.dart';
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
      color: Colors.red,
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
        Image.network(isAddStory ? currentUser.imageUrl : story.imageUrl)
      ],
    );
  }
}
