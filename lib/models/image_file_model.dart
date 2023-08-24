class ImageFileModel {
  List<String>? files;
  String? folder;

  ImageFileModel({this.files, this.folder});

  ImageFileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['files'] = this.files;
    data['folderName'] = this.folder;
    return data;
  }
}