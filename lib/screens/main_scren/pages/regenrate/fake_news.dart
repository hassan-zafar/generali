import 'package:flutter/material.dart';
import 'package:generali/model/news.dart';

List<News> fackNewsData() {
  return <News>[
    News(
      id: '111',
      rating: 2,
      thumbnailURL: '',
      title: 'This is the First Cat Title 111',
    ),
    News(
      id: '222',
      rating: 4,
      isOnline: false,
      subscription: true,
      thumbnailURL: '',
      title: 'This is the First Cat Title 222',
    ),
    News(
      id: '333',
      rating: 1,
      isOnline: false,
      thumbnailURL: '',
      title: 'This is the First Cat Title 333',
    ),
    News(
      id: '444',
      rating: 4.5,
      subscription: true,
      thumbnailURL: '',
      title: 'This is the First Cat Title 444',
    ),
  ];
}
