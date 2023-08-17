import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/home/profile/profile_appbar.dart';
import 'package:instagram_clone_flutter/widgets/circular_image.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ProfileAppbar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                //==========================ROW 1==========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircularImageWithBackground(
                          foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                        ),
                        Text('Useranme'),
                        Text('bio')
                      ],
                    ),
                    Column(
                      children: [Text('20'), Text('Posts')],
                    ),
                    Column(
                      children: [Text('20'), Text('Followers')],
                    ),
                    Column(
                      children: [Text('20'), Text('Following')],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //==========================ROW 2======================
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          child: Text('Edit Profile')),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          child: Text('Share Profile')),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Icon(
                        Icons.person_add_outlined,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
