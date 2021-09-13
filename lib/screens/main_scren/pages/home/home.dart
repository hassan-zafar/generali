import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/providers/home_slider_provider.dart';
import 'package:generali/screens/widgets/custom_appbar_background.dart';
import 'package:generali/screens/widgets/search_textformfield.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';
import 'package:provider/provider.dart';
import 'custom_circular_slider.dart';
import 'home_categories_card_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
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
                left: 0,
                right: 0,
                child: CarouselSlider(
                  // ignore: always_specify_types
                  items: [
                    _firstcategory(provider),
                    _secondCategory(provider),
                    _thirdCategory(provider)
                  ].map((HomeCategoiesCardWidget card) => card).toList(),
                  options: CarouselOptions(
                    height: 180.0,
                    disableCenter: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                ),
              ),
            ),
          ],
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
