import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:instagram_clone_flutter/models/image_file_model.dart';
import 'package:instagram_clone_flutter/screens/home/uploadMedia/widgets/media_upload_appbar.dart';

class UploadMedia extends StatefulWidget {
  const UploadMedia({super.key});
  static const tag = '/upload';

  @override
  State<UploadMedia> createState() => _UploadMediaState();
}

class _UploadMediaState extends State<UploadMedia> {
  List<ImageFileModel> _files = [];
  ImageFileModel? _selectedModel;
  String? image;
  @override
  void initState() {
    super.initState();
    getImagesPath();
  }

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;
    _files = images.map<ImageFileModel>((e) => ImageFileModel.fromJson(e)).toList();
    if (_files.length > 0)
      setState(() {
        _selectedModel = _files[0];
        image = _selectedModel?.files?[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaUploadAppbar(),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.black45,
              child: image != null
                  ? Image.file(
                      File(image!),
                    )
                  : Container()),
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<ImageFileModel>(
                              isExpanded: true,
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: _files
                                  .map((ImageFileModel item) => DropdownMenuItem<ImageFileModel>(
                                        value: item,
                                        child: Text(
                                          item.folder!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: _selectedModel,
                              onChanged: (ImageFileModel? value) {
                                setState(() {
                                  _selectedModel = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.expand_more_outlined,
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
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
                              crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 2),
                          itemCount: _selectedModel?.files?.length,
                          itemBuilder: (BuildContext context, int index) {
                            var file = _selectedModel?.files?[index];
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                GestureDetector(
                                  child: file != null
                                      ? Image.file(
                                          File(file),
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                        color: Colors.black45,
                                      ),
                                  onTap: () {
                                    setState(() {
                                      image = file;
                                    });
                                  },
                                ),
                                Positioned(
                                  right: 2,
                                  top: 2,
                                  child: Icon(Icons.circle_outlined, color: Colors.white),
                                ),
                                Positioned(
                                  right: 2,
                                  top: 2,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                                  ),
                                )
                              ],
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
}
