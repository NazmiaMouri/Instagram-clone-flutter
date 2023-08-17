import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key});
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
            'User Name',
            style: TextStyle(letterSpacing: .5, fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: Icon(
                  Icons.menu_outlined,
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
