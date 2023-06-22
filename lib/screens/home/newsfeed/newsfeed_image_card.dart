import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/widgets/circular_image_with_border.dart';

class NewsFeedImageCard extends StatelessWidget {
  const NewsFeedImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularImageWithBorder(
                    backgroundImageURL: 'lib/assets/images/desktop.png',
                    foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('name')
                ],
              ),
              InkWell(
                child: Icon(
                  Icons.more_vert_outlined,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Image.network(
          "https://i.imgur.com/OB0y6MR.jpg",
          // headers: prefManager.httpHeaders,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.maps_ugc_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.send_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              InkWell(
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
