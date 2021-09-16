import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/model/course.dart';
import 'package:generali/screens/main_scren/pages/aprenda/courses_tile_widget.dart';
import 'package:generali/screens/widgets/custom_appbar_background.dart';

class Aprenda extends StatelessWidget {
  const Aprenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const CustomAppBarBackbround(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '   Courses',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 1000,
                itemBuilder: (BuildContext context, int index) =>
                    CoursesTileWidget(
                  course: Courses(
                    id: index.toString(),
                    title: 'Course No: $index',
                    detail: 'This is the detail of all the courses',
                    viewed: double.parse(index.toString()),
                    thumbnailURL: '',
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    isFav: (index % 3 == 0) ? true : false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
