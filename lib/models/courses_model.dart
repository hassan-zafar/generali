import 'dart:convert';

class Courses {
   List<dynamic> ? content;
   String ?pageable = {} as String;
   int ?totalElements;
   bool ?last;
   int ?totalPages;
   bool ?first;
   String sort = {} as String;
   int ?numberOfElements;
   int ?size;
   int ?number;
   bool ?empty;

  Courses({this.content,this.totalElements,this.last,this.totalPages,this.first,required this.sort,this.numberOfElements,this.size,this.number,this.empty,this.pageable, List headers});

  Map<String, dynamic> toMap() {
    return {
      'content': content?.map((x) => x.toMap()).toList(),
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

  factory Courses.fromJson(map) {
    return Courses(
      content: List<dynamic>.from(map['content'] as List<dynamic>),
      last: map['last'],

      totalElements: map['totalElements']
      totalPages: map['totalPages'],
      first: map['first'],
      numberOfElements: map['numberOfElements'],
      size: map['size'],
      number: map['number'],
      empty: map['empty'], sort: '',
    );
  }

}
