import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../model/course.dart';
import '../../../../utilities/custom_colors.dart';
import '../../../../utilities/custom_images.dart';
import '../../../../utilities/utilities.dart';
import '../../../course_detail/course_detail.dart';

class CoursesTileWidget extends StatelessWidget {
  const CoursesTileWidget({
    required this.course,
    this.showFavIcon = true,
    Key? key,
  }) : super(key: key);
  final Courses course;
  final bool showFavIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<CourseDetail>(
            builder: (BuildContext context) => CourseDetail(course: course),
          ),
        );
      },
      child: Container(
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
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            _courseImage(),
            _courseInfo(context),
            if (showFavIcon)
              IconButton(
                splashRadius: 10,
                onPressed: () {},
                icon: (course.isFav!)
                    ? Icon(Icons.favorite,
                        color: Theme.of(context).primaryColor)
                    : Icon(Icons.favorite, color: CustomColors.lightGrey),
              )
            else
              const SizedBox(),
            const SizedBox(width: 10),
          ],
        ),
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
