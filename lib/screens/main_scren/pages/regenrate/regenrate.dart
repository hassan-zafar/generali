import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/model/news.dart';
import 'package:generali/screens/main_scren/pages/regenrate/fake_news.dart';
import 'package:generali/screens/main_scren/pages/regenrate/news_tile_widget.dart';
import 'package:generali/screens/widgets/custom_appbar_background.dart';
import 'package:generali/utilities/utilities.dart';

class Regenrate extends StatelessWidget {
  const Regenrate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const CustomAppBarBackbround(),
        Padding(
          padding: EdgeInsets.only(left: Utilities.padding),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              final List<News> _list = fackNewsData();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Category No $index',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 1.22,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int secInd) =>
                          NewsTileWidget(news: _list[secInd]),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Container(),
      ],
    );
  }
}
