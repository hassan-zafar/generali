import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../../model/course.dart';
import '../../../../providers/home_slider_provider.dart';
import '../../../../utilities/custom_images.dart';
import '../../../../utilities/utilities.dart';
import '../../../widgets/custom_appbar_background.dart';
import '../../../widgets/search_textformfield.dart';
import '../aprenda/courses_tile_widget.dart';
import '../regenrate/fake_news.dart';
import 'custom_circular_slider.dart';
import 'home_categories_card_widget.dart';
import 'new_card_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Flexible(
          child: Stack(
            children: <Widget>[
              const CustomAppBarBackbround(),
              SearchTextFormField(
                search: _search,
                onTap: () {
                  // TODO: on search
                },
              ),
              Consumer<HomeSliderProvider>(
                builder: (
                  BuildContext context,
                  HomeSliderProvider provider,
                  Widget? child,
                ) =>
                    Positioned(
                  top: 80,
                  left: Utilities.padding,
                  right: 0,
                  child: CarouselSlider(
                    // ignore: always_specify_types
                    items: [
                      _firstcategory(provider),
                      _secondCategory(provider),
                      _thirdCategory(provider)
                    ].map((HomeCategoiesCardWidget card) => card).toList(),
                    options: CarouselOptions(
                      height: 190.0,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: Utilities.padding),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _TitalAndActionButtonWidget(
                  title: 'News',
                  onPress: () {},
                ),
                SizedBox(
                  height: _size.width / 2.4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCardWidget(
                        size: _size,
                        news: fackNewsData()[index],
                      );
                    },
                  ),
                ),
                _TitalAndActionButtonWidget(
                  title: 'Watching Courses',
                  onPress: () {},
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 1000,
                    itemBuilder: (BuildContext context, int index) =>
                        CoursesTileWidget(
                      showFavIcon: false,
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
          ),
        ),
      ],
    );
  }

  HomeCategoiesCardWidget _thirdCategory(HomeSliderProvider provider) {
    final GlobalKey _key = GlobalKey<FormState>();
    return HomeCategoiesCardWidget(
      title: 'Estado de la formation',
      action: GestureDetector(
        onTap: () {
          // TODO: help
        },
        child: const Icon(Icons.help),
      ),
      child: Form(
        key: _key,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomCircularSlider(
              title: 'Intinerarios',
              initialValue: provider.trainingIndicatorMandatory,
              onChange: (double mandatory) =>
                  provider.onTrainingIndicatorMandatoryChange(mandatory),
            ),
            CustomCircularSlider(
              title: 'Estrategica',
              initialValue: provider.trainingIndicatorPath,
              onChange: (double path) =>
                  provider.onTrainingIndicatorPathChange(path),
            ),
            CustomCircularSlider(
              title: 'Obligatoria',
              initialValue: provider.trainingIndicatorStrategic,
              onChange: (double strategic) =>
                  provider.onTrainingIndicatorStrategicChange(strategic),
            ),
          ],
        ),
      ),
    );
  }

  HomeCategoiesCardWidget _secondCategory(HomeSliderProvider provider) {
    return HomeCategoiesCardWidget(
      title: 'Formacion continua',
      action: GestureDetector(
        onTap: () {
          // TODO: help
        },
        child: const Icon(Icons.help),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 74,
                child: Image.asset(CustomImages.medalOro),
              ),
              const SizedBox(width: 20),
              Column(
                children: <Widget>[
                  Text(
                    '${provider.trainingHours} / 25',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'ANO ACTUAL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  HomeCategoiesCardWidget _firstcategory(HomeSliderProvider provider) {
    return HomeCategoiesCardWidget(
      title: 'Liga Leonizate',
      action: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO: Help
            },
            child: const Icon(Icons.help),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // TODO: Add button
            },
            child: const Icon(Icons.add_circle_outlined),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Utilities.padding * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 24,
                  child: Image.asset(CustomImages.medalSilver),
                ),
                SizedBox(
                  height: 36,
                  child: Image.asset(CustomImages.medalSilver),
                ),
                SizedBox(
                  height: 50,
                  child: Image.asset(CustomImages.medalSilver),
                ),
                SizedBox(
                  height: 78,
                  child: Image.asset(CustomImages.medalMaster),
                ),
              ],
            ),
          ),
          Slider(
            semanticFormatterCallback: (double value) => '$value',
            activeColor: Colors.amber,
            max: 60,
            value: provider.rankPositionMedal,
            onChanged: (double rank) =>
                provider.onRankPositionMedalChange(rank),
          ),
        ],
      ),
    );
  }
}

class _TitalAndActionButtonWidget extends StatelessWidget {
  const _TitalAndActionButtonWidget({
    required this.title,
    required this.onPress,
    Key? key,
  }) : super(key: key);
  final String title;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPress,
          child: Row(
            children: const <Widget>[
              Text('View', style: TextStyle(fontSize: 18)),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
