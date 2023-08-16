import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/widgets/circular_image_with_gradient_border.dart';

class NewsFeedImageCard extends StatelessWidget {
  const NewsFeedImageCard({required this.foregroundImageURL, super.key});
  final foregroundImageURL;

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
                    backgroundImageURL: 'lib/assets/images/no_user.png',
                    foregroundImageURL: foregroundImageURL,
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
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.report_gmailerrorred_outlined, color: Colors.grey, size: 40),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Sorry, couldn't load image.", style: TextStyle(color: Colors.grey))
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 5,
        ),
        const Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
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
