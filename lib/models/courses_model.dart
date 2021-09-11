class CourseModel {
   List<dynamic>  content;
   // ignore: always_specify_types
   dynamic pageable = {};
   dynamic totalElements;
   // ignore: unnecessary_question_mark
   dynamic last;
   dynamic totalPages;
   dynamic first;
   dynamic sort = {};
   dynamic numberOfElements;
   dynamic size;
   dynamic number;
   dynamic empty;
  // ignore: sort_constructors_first
  CourseModel({required this.content,required this.totalElements,this.last,this.totalPages,this.first,required this.sort,this.numberOfElements,this.size,this.number,this.empty,required this.pageable});

  Map<String, dynamic> toMap() {
    return {
      'content': content.map((x) => x.toMap()).toList(),
      'totalElements': totalElements,
      'last': last,
      'totalPages': totalPages,
      'first': first,
      'numberOfElements': numberOfElements,
      'size': size,
      'number': number,
      'empty': empty,
    };
  }

  // ignore: sort_constructors_first
  factory CourseModel.fromJson(map) {
    return CourseModel(
      content: List<dynamic> .from(map['content'] as List<dynamic>),
      totalElements: map['totalElements'],
      last: map['last'],
      totalPages: map['totalPages'],
      first: map['first'],
      numberOfElements: map['numberOfElements'],
      size: map['size'],
      number: map['number'],
      empty: map['empty'],
      pageable: map['pageable'],
      sort: map['sort'],

    );
  }

}
