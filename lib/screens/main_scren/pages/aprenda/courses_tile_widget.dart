import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/model/course.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class CoursesTileWidget extends StatelessWidget {
  const CoursesTileWidget({required this.course, Key? key}) : super(key: key);
  final Courses course;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: Utilities.padding / 2,
        horizontal: Utilities.padding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utilities.searchBorderRadius),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 9,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          _courseImage(),
          _courseInfo(context),
          IconButton(
            splashRadius: 10,
            onPressed: () {},
            icon: (course.isFav!)
                ? Icon(Icons.favorite, color: Theme.of(context).primaryColor)
                : Icon(Icons.favorite, color: CustomColors.lightGrey),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Expanded _courseInfo(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(Utilities.padding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              course.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              course.detail!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: CustomColors.lightGrey,
              ),
            ),
            const Spacer(),
            Text('${course.viewed}%'),
            Stack(
              children: <Widget>[
                Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.lightGrey,
                    borderRadius:
                        BorderRadius.circular(Utilities.buttonBorderRadius),
                  ),
                ),
                Container(
                  height: 2,
                  width: course.viewed! * 1.96,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.circular(Utilities.buttonBorderRadius),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _courseImage() {
    return SizedBox(
      height: double.infinity,
      width: 90,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Utilities.searchBorderRadius),
          topLeft: Radius.circular(Utilities.searchBorderRadius),
        ),
        child: Image.asset(CustomImages.icon, fit: BoxFit.cover),
      ),
    );
  }
}
