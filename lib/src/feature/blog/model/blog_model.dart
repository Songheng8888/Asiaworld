

class CategoryBlogModel {
  final String id;
  final String name;
  final String img;
  factory CategoryBlogModel.fromJson(Map<String, dynamic> json) {
    return CategoryBlogModel(
        id: json["id"]!.toString(),
        name: json["name"]!,
        img: json["image_url"]!);
  }
  CategoryBlogModel({required this.id, required this.name, required this.img});
}

class BlogModel {
  final String id;
  final String thumnail;
  final String content;
  final String cateId;
  final String title;
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
        id: json["id"]!.toString(),
        thumnail: json["thumbnail_url"]!,
        content: json["content"].toString().replaceAll(r"\", ""),
        cateId: json["category_id"]!.toString(),
        title: json["title"]!);
  }
  BlogModel(
      {required this.id,
      required this.thumnail,
      required this.content,
      required this.cateId,
      required this.title});
}
