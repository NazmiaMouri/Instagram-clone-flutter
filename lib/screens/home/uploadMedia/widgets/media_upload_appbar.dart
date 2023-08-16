import 'package:flutter/material.dart';

class MediaUploadAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MediaUploadAppbar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.close_outlined,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "New post",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            InkWell(
              child: Text("Next", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            )
          ],
        ),
      ),
    );
  }
}
