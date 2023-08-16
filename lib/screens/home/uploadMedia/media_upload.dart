import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/home/uploadMedia/widgets/media_upload_appbar.dart';

class UploadMedia extends StatefulWidget {
  const UploadMedia({super.key});
  static const tag = '/upload';

  @override
  State<UploadMedia> createState() => _UploadMediaState();
}

class _UploadMediaState extends State<UploadMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaUploadAppbar(),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
