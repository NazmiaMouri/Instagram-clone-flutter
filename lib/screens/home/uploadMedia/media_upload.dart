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
  List<String> imageFile = [];
  final Directory _photoDir =
      new Directory('/storage/emulated/0/Android/data/com.eclixtech.doc_scanner/files/CroppedImages');
  var imageList = [];
  @override
  void initState() {
    _getFromCamera();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(imageFile.length);
    return Scaffold(
      appBar: MediaUploadAppbar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.red,
            child: Card(
              color: Colors.amber,
              child: Center(child: Text('index')),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5, // Initial size of the sheet
            minChildSize: 0.5, // Minimum size the sheet can be dragged to
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
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
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: GridView.builder(
                          controller: scrollController,
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
                          }),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  /// Get from Camera
  _getFromCamera() async {
    imageList =
        _photoDir.listSync().map((item) => item.path).where((item) => item.endsWith(".jpg")).toList(growable: false);
    // List<XFile> pickedFile = await ImagePicker().pickMultiImage(
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    // setState(() {
    //   imageFile = pickedFile.map((e) => e.path).toList();
    // });
  }
}
