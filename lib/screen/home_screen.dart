import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryArea(),
          const FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            10,
            (index) => UserStory(
                  userName: 'User $index',
                )),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text('$userName'),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final FeedDataList = [
  FeedData(userName: 'User 1', likeCount: 50, content: '안녕하세요 제가 이번에 인스타그램 클론 코딩을 해보는 중입니다. 처음이라 어렵지만 재미있습니다. 감사합니다.'),
  FeedData(userName: 'User 2', likeCount: 24, content: '오늘 아침은 맛있었다'),
  FeedData(userName: 'User 3', likeCount: 36, content: '어제 점심은 맛있었다'),
  FeedData(userName: 'User 4', likeCount: 12, content: '오늘 저녁은 맛있었다'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: FeedDataList.length,
        itemBuilder: (context, index) =>
            FeedItem(feedData: FeedDataList[index]));
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_horiz)
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 250,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () => print('tab favorite_button'),
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.chat_bubble),
                    onPressed: () => print('tab chat_bubble'),
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.paperplane),
                    onPressed: () => print('tab paper plane'),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () => print('tab bookmark'),
                  icon: Icon(CupertinoIcons.bookmark))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('좋아요 ${feedData.likeCount}개', style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: feedData.content)
              ],
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
