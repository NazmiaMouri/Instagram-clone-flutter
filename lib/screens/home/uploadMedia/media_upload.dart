import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/home/uploadMedia/widgets/media_upload_appbar.dart';

class UploadMedia extends StatelessWidget {
  const UploadMedia({super.key});
  static const tag = '/upload';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaUploadAppbar(),
      body: SafeArea(child: Container()),
    );
  }
}
