import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/home/uploadMedia/widgets/media_upload_appbar.dart';
import 'package:image_picker/image_picker.dart';

class UploadMedia extends StatefulWidget {
  const UploadMedia({super.key});
  static const tag = '/upload';

  @override
  State<UploadMedia> createState() => _UploadMediaState();
}

class _UploadMediaState extends State<UploadMedia> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaUploadAppbar(),
      body: Container(
     
        height: 200,
        color: Colors.red,
        child: Card(
          color: Colors.amber,
          child: Center(child: Text('index')),
        ),
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.5, // Initial size of the sheet
        minChildSize: 0.5, // Minimum size the sheet can be dragged to
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return ListView(
            controller: scrollController,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Row(children: [
                        Text(
                          'Recent',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.expand_more_outlined,
                        ),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            icon: Icon(
                              Icons.library_add_outlined,
                              size: 20,
                            ),
                            label: Text(
                              'SELECT MULTIPLE',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: null,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                            child: Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 300,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.amber,
                      child: Center(child: Text('$index')),
                    );
                  })
            ],
          );
        },
      ),
    );
  }

  /// Get from gallery
  // _getFromGallery() async {
  //   List<XFile> pickedFile = await ImagePicker().pickMultiImage(
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  // /// Get from Camera
  // _getFromCamera() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
}
