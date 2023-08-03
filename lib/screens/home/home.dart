import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone_flutter/screens/home/newsfeed/newsfeed.dart';
import 'package:instagram_clone_flutter/screens/home/search/search.dart';
import 'package:instagram_clone_flutter/screens/home/uploadMedia/media_upload.dart';
import 'package:instagram_clone_flutter/widgets/circular_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const tag = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  Widget screen() {
    switch (selectedIndex) {
      case 0:
        return Newsfeed();
      case 1:
        return Search();

      default:
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 2) {
            Navigator.pushNamed(context, UploadMedia.tag);
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
              activeIcon: Text(
                String.fromCharCode(Icons.search_outlined.codePoint),
                style: TextStyle(
                  color: Colors.black,
                  inherit: false,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: Icons.search_outlined.fontFamily,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.smart_display_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircularImageWithBackground(
                    backgroundImageURL: 'lib/assets/images/desktop.png',
                    foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                    width: 22,
                    height: 22,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(color: Colors.red[700], shape: BoxShape.circle),
                  )
                ],
              ),
              activeIcon: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: Colors.black)),
                child: CircularImageWithBackground(
                  backgroundImageURL: 'lib/assets/images/desktop.png',
                  foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                  width: 22,
                  height: 22,
                ),
              ),
              label: '')
        ],

      ),
    );
  }
}
