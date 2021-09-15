import 'package:flutter/material.dart';

class News {
  News({
    this.id,
    this.thumbnailURL,
    this.title,
    this.subscription = false,
    this.isOnline = true,
    this.rating = 0,
  });

  final String? id;
  final String? thumbnailURL;
  final String? title;
  final bool? subscription;
  final bool? isOnline;
  final double? rating;
}
