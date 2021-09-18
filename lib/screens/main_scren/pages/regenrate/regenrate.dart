import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../model/news_2no.dart';
import '../../../../utilities/utilities.dart';
import '../../../widgets/custom_appbar_background.dart';
import 'fake_news.dart';
import 'news_tile_widget.dart';

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
              final List<News2No> _list = fackNewsData();
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
