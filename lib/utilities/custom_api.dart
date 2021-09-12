class CustomAPI {
  String get base => 'https://precampusgenerali.enzymeadvisinggroup.com/api2';
  String get authenticate => '/authenticate';
  String get news => '/api/v2/my-offerings/new';
  String get offerings => '/api/v2/my-offerings';
  String get profile => '/api/v2/me/profile';
  String get rankingPositionMedal => '/api/v2/me/ranking_position_medal';
  // TODO: slide 9 left
  String get trainingHours => '/api/v2/me/training_hours';
  String get trainingIndicators => '/api/v2/me/training_indicators';
  String get search => '/api/v2/search';
  String get areas => '/api/v2/search/areas';
  // TODO: slide 17 left
  String get popular => '/api/v2/my-offerings/popular';
  String get valued => '/api/v2/my-offerings/valued';
  // TODO: slide 20 left
}
