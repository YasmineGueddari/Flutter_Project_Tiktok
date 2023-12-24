import 'package:flutter/material.dart';
import 'package:tiktok/components/profile/profile_component.dart';
import 'package:tiktok/components/sidebar/sidebar_component.dart';
import 'package:tiktok/components/video_player/video_player_component.dart';

class FeedComponent extends StatelessWidget {
  final Map<String, dynamic> item;

  const FeedComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayerComponent(
          media: item['media'],
        ),
        Positioned(
          bottom: 120.0,
          left: 20.0,
          right: 100.0,
          child: ProfileComponent(
            item: item,
          ),
        ),
        Positioned(
          bottom: 120.0,
          right: 20.0,
          child: SidebarComponent(
            item: item,
          ),
        ),
      ],
    );
  }
}
