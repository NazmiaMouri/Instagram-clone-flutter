import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone_flutter/screens/home/newsfeed/newsfeed_appbar.dart';
import 'package:instagram_clone_flutter/screens/home/newsfeed/newsfeed_image_card.dart';
import 'package:instagram_clone_flutter/screens/home/newsfeed/newsfeed_video_card.dart';
import 'package:instagram_clone_flutter/widgets/circular_image.dart';
import 'package:instagram_clone_flutter/widgets/circular_image_with_gradient_border.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({super.key});

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  List listItem = List.generate(10, (index) => index);
  bool _isLoading = false;
  ScrollController listViewController = ScrollController();
  @override
  void initState() {
    super.initState();

    listViewController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (listViewController.position.pixels == listViewController.position.maxScrollExtent) {
      // Reached the bottom, load more content
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    print('POPO');
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simulate loading delay
      await Future.delayed(Duration(seconds: 2));

      List<int> newItems = List.generate(10, (index) => listItem.length + index);
      setState(() {
        listItem.addAll(newItems);
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    listViewController.removeListener(_scrollListener);
    listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppbar(),
      body: SingleChildScrollView(
        controller: listViewController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //===========================StoryLines========================
            Container(
              height: 140,
              child: ListView(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () => print('UPLOAD'),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircularImageWithBackground(
                              backgroundImageURL: 'lib/assets/images/desktop.png',
                              foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                              width: 80,
                              height: 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1.0, color: Colors.white)),
                              child: Icon(
                                Icons.add_circle_outlined,
                                color: Colors.blue[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('your story')
                    ],
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 120,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircularImageWithBorder(
                                backgroundImageURL: 'lib/assets/images/no_user.png',
                                foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                                width: 80,
                                height: 80,
                              ),
                              SizedBox(
                                  width: 90,
                                  child: Text(
                                    'user name tomalik aby nhgb',
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10),
                        itemCount: 10),
                  ),
                ],
              ),
            ),
            //=========================Newsfeed POST=========================
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listItem.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < listItem.length) {
                    if (listItem[index] % 2 == 0) {
                      return NewsFeedImageCard(foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg");
                    } else {
                      // return NewsFeedVideoCard();
                    }
                  } else {
                    if (_isLoading) {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
