class CustomAPI {
  static String get base =>
      'https://precampusgenerali.enzymeadvisinggroup.com/api2';
  static String get authenticate => '/authenticate';
  static String get news => '/api/v2/my-offerings/new';
  static String get offerings => '/api/v2/my-offerings';
  static String get profile => '/api/v2/me/profile';
  static String get rankingPositionMedal => '/api/v2/me/ranking_position_medal';
  // TODO: slide 9 left
  static String get trainingHours => '/api/v2/me/training_hours';
  static String get trainingIndicators => '/api/v2/me/training_indicators';
  static String get search => '/api/v2/search';
  static String get areas => '/api/v2/search/areas';
  // TODO: slide 17 left
  static String get popular => '/api/v2/my-offerings/popular';
  static String get valued => '/api/v2/my-offerings/valued';
  // TODO: slide 20 left
}
