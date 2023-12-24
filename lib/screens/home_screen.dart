import 'package:flutter/material.dart';
import 'package:tiktok/components/feed/feed_component.dart';

const List<Map<String, dynamic>> data = [
  {
    "profile": {
      "username": "johnbody",
      "avatar": "https://i.pravatar.cc/300?id=1",
    },
    "media": "assets/videos/video-1.mp4",
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "likeCount": 12000,
    "commentCount": 14000,
  },
  {
    "profile": {
      "username": "yasmine",
      "avatar": "https://i.pravatar.cc/300?id=2",
    },
    "media": "assets/videos/video-2.mp4",
    "description":
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
    "likeCount": 10,
    "commentCount": 1,
  },
  {
    "profile": {
      "username": "hanine",
      "avatar": "https://i.pravatar.cc/300?id=3",
    },
    "media": "assets/videos/video-3.mp4",
    "description":
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
    "likeCount": 1340,
    "commentCount": 76,
  }
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: data.map((item) {
          return FeedComponent(
            item: item,
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            print(value);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: "Messenger",
            ),
          ]),
    );
  }
}
