import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../model/course.dart';
import '../../../utilities/custom_colors.dart';
import '../../../utilities/utilities.dart';
import '../widgets/video_widget.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({required this.course, Key? key}) : super(key: key);
  final Courses course;
  String url = 'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoWidget(videoURL: url),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  _acceptButton(context),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(Utilities.padding),
                          child: Text(
                            course.title!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(thickness: 2),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Utilities.padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _IcoicTitleButton(
                                icon: Icons.access_time_rounded,
                                title: '3.00',
                                onTap: () {},
                              ),
                              _IcoicTitleButton(
                                icon: CupertinoIcons.eye_solid,
                                title: 'Visualizations',
                                onTap: () {},
                              ),
                              _IcoicTitleButton(
                                icon: Icons.link_rounded,
                                title: 'Tipo Productos',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 2),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utilities.padding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _consultButton(context),
                              _rating(context),
                              const SelectableText(
                                  'A paragraph is a group of related sentences that support one main idea. In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _acceptButton(BuildContext context) {
    return Positioned(
      left: Utilities.padding,
      right: Utilities.padding,
      bottom: Utilities.padding,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(Utilities.padding),
        margin: EdgeInsets.all(Utilities.padding),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Utilities.searchBorderRadius,
          ),
        ),
        child: const Text(
          'Accede al soports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row _rating(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.hand_thumbsup,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.hand_thumbsdown,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Spacer(),
        RatingBar(
          itemSize: 20,
          wrapAlignment: WrapAlignment.end,
          initialRating: 3,
          minRating: 1,
          maxRating: 5,
          allowHalfRating: true,
          onRatingUpdate: (double rating) {
            // TODO: on change
          },
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.amber),
            half: const Icon(Icons.star_border_purple500, color: Colors.amber),
            empty: Icon(Icons.star_border, color: CustomColors.darkGrey),
          ),
        ),
      ],
    );
  }

  GestureDetector _consultButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utilities.padding,
          vertical: Utilities.padding / 2,
        ),
        margin: EdgeInsets.symmetric(vertical: Utilities.padding),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Utilities.buttonBorderRadius,
          ),
        ),
        child: const Text(
          'Consultado',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _IcoicTitleButton extends StatelessWidget {
  const _IcoicTitleButton({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(icon),
          ),
          Text(
            title,
            style: TextStyle(color: CustomColors.lightGrey),
          ),
        ],
      ),
    );
  }
}
