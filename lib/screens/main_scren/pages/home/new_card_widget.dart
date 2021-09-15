import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/model/news.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({required this.size, required this.news, Key? key})
      : super(key: key);
  final Size size;
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1.6,
      height: size.width / 2.6,
      margin: EdgeInsets.only(right: Utilities.padding / 2, bottom: 4, left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utilities.searchBorderRadius),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Utilities.searchBorderRadius),
                topRight: Radius.circular(Utilities.searchBorderRadius),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(CustomImages.icon, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Utilities.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    news.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    news.characteristics!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
