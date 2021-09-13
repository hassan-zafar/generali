class Courses {
  Courses({
    this.id,
    this.title,
    this.detail,
    this.thumbnailURL,
    this.viewed,
    this.isFav = false,
  });

  final String? id;
  final String? title;
  final String? detail;
  final String? thumbnailURL;
  final double? viewed;
  final bool? isFav;
}
