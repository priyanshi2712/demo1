// This comment is for ttesting purpose, remove this.

class Categorys {
  // final int selectedIndex;
  final String? names;
  final String? categoryName;

  Categorys({
    // required this.selectedIndex,
    required this.names,
    this.categoryName,
  });
}

class Detail {
  final String? description;
  final String? title;
  final String? image;
  List<String>? tag;
  Detail({
    required this.description,
    required this.title,
    required this.image,
    required this.tag,
  });
}
