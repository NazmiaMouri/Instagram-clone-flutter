import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsFeedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NewsFeedAppbar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Instagram',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(letterSpacing: .5, fontSize: 30, color: Colors.black),
            ),
          ),
          const Row(
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
                  Icons.chat_bubble_outline_outlined,
                  size: 30,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
