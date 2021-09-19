import 'dart:collection';

class News {
  News({
    this.totalPages,
    this.totalElements,
    this.number,
    this.first,
    this.last,
    this.content,
  });
  int? totalPages;
  int? totalElements;
  int? number;
  bool? first;
  bool? last;
  List<Content>? content;

  // ignore: sort_constructors_first
  factory News.fromJson(Map<String, dynamic> json) {
    String jsnStr =
        json['content'].toString().replaceAll('[', '').replaceAll("]", "");
    print(json['content'].runtimeType);

    print(json['content'].length);
    List<Content>? contentTemp = [];

    json['content'].forEach((e) {
      contentTemp.add(Content.fromJson(e));
    });
    // print(_list);
    // List<Content> con = [];
    // List<Map<String, dynamic>> mapp = [];

    return News(
        totalPages: int.parse(json['totalPages'].toString()),
        totalElements: int.parse(json['totalElements'].toString()),
        number: int.parse(json['number'].toString()),
        first: bool.fromEnvironment(json['first'].toString()),
        last: bool.fromEnvironment(json['last'].toString()),
        content: contentTemp
        // List<Content>.from(
        //   json['content'],
        // ),
        );
  }
}

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['totalPages'] = totalPages;
//   data['totalElements'] = totalElements;
//   data['number'] = number;
//   data['first'] = first;
//   data['last'] = last;
//   if (content != null) {
//     // data['content'] = content!.map((Content v) => v.toJson()).toList();
//   }
//   return data;
// }

class Content {
  Content({
    this.modality,
    this.type,
    this.id,
    this.title,
    this.status,
    this.image,
    this.characteristics,
    this.rating,
    this.topic,
    this.subtopic,
  });

  String? modality;
  String? type;
  int? id;
  String? title;
  String? status;
  String? image;
  String? characteristics;
  double? rating;
  String? topic;
  String? subtopic;

  // ignore: sort_constructors_first
  factory Content.fromJson(
          // Map<String, dynamic>
          dynamic json) =>
      Content(
        modality: json['modality'] == null ? '' : json['modality'].toString(),
        type: json['type'] == null ? '' : json['type'].toString(),
        id: json['id'] == null ? -1 : int.parse(json['id'].toString()),
        title: json['title'] == null ? '' : json['title'].toString(),
        status: json['status'] == null ? '' : json['status'].toString(),
        image: json['image'] == null ? '' : json['image'].toString(),
        characteristics: json['characteristics'] == null
            ? ''
            : json['characteristics'].toString(),
        rating: json['rating'] == null
            ? 0
            : double.parse(json['rating'].toString()),
        topic: json['topic'] == null ? '' : json['topic'].toString(),
        subtopic: json['subtopic'] == null ? '' : json['subtopic'].toString(),
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['modality'] = modality;
  //   data['type'] = type;
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['status'] = status;
  //   data['image'] = image;
  //   data['characteristics'] = characteristics;
  //   data['rating'] = rating;
  //   data['topic'] = topic;
  //   data['subtopic'] = subtopic;
  //   return data;
  // }
}
