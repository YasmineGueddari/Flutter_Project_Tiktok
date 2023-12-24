import 'package:flutter/material.dart';
import 'package:tiktok/components/widgets/avatar_widget.dart';
import 'package:tiktok/components/widgets/comment_widget.dart';
import 'package:tiktok/components/widgets/like_widget.dart';

class SidebarComponent extends StatelessWidget {
  final Map<String, dynamic> item;

  const SidebarComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: AvatarWidget(
            profile: item['profile'],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: LikeWidget(
            count: item['likeCount'],
            onPressed: () => print("Like"),
          ),
        ),
        CommentWidget(
          count: item['commentCount'],
          onPressed: () => print("Comment"),
        ),
      ],
    );
  }
}
