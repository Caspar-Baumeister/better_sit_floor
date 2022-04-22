class PostureModel {
  int id;
  String name;
  String imgUrl;
  List<String> info;

  PostureModel(
      {required this.id,
      required this.imgUrl,
      required this.info,
      required this.name});

  factory PostureModel.fromJson(Map json, int id) {
    return PostureModel(
      id: id,
      name: json['name'],
      imgUrl: json['imgSrc'],
      info: json['info'],
    );
  }
}
