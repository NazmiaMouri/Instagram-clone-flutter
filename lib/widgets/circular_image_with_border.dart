import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/widgets/circular_image.dart';

class CircularImageWithBorder extends StatelessWidget {
  CircularImageWithBorder(
      {Key? key, required this.backgroundImageURL, required this.foregroundImageURL, this.width = 40, this.height = 40})
      : super(key: key);
  String backgroundImageURL;
  String foregroundImageURL;
  double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.purple, Colors.amber]),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircularImageWithBackground(
          backgroundImageURL: backgroundImageURL,
          foregroundImageURL: foregroundImageURL,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
