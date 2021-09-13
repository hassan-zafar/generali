import 'package:flutter/material.dart';

class HomeSliderProvider extends ChangeNotifier {
  int _sliderCurrentIndex = 0;
  double _rankPositionMedal = 0;
  int _trainingHours = 1;
  double _trainingIndicatorMandatory = 0;
  double _trainingIndicatorPath = 0;
  double _trainingIndicatorStrategic = 0;

  int get sliderCurrentIndex => _sliderCurrentIndex;
  double get rankPositionMedal => _rankPositionMedal;
  int get trainingHours => _trainingHours;
  double get trainingIndicatorMandatory => _trainingIndicatorMandatory;
  double get trainingIndicatorPath => _trainingIndicatorPath;
  double get trainingIndicatorStrategic => _trainingIndicatorStrategic;

  void onSliderPageChange(int index) {
    _sliderCurrentIndex = index;
    notifyListeners();
  }

  void onRankPositionMedalChange(double rank) {
    _rankPositionMedal = rank;
    notifyListeners();
  }

  void onTrainingHoursChange(int hours) {
    _trainingHours = hours;
    notifyListeners();
  }

  void onTrainingIndicatorMandatoryChange(double mandatory) {
    _trainingIndicatorMandatory = mandatory;
    notifyListeners();
  }

  void onTrainingIndicatorPathChange(double path) {
    _trainingIndicatorPath = path;
    notifyListeners();
  }

  void onTrainingIndicatorStrategicChange(double strategic) {
    _trainingIndicatorStrategic = strategic;
    notifyListeners();
  }
}
