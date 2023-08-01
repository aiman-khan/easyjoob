class EndPoints {
  static const baseUrl = "http://yalaxi.naveedullah.me";

  /// places api
  static const String placesSearch =
      "https://maps.googleapis.com/maps/api/place/textsearch/json";

  static const register = "$baseUrl/api/register";

  static const login = "$baseUrl/api/login";

  static const String initiatePayment = '$baseUrl/api/initiate_payment';

  static const createRide = "$baseUrl/api/create_ride";

  static const endRide = "$baseUrl/api/end_ride";

  static const getRide = "$baseUrl/api/get_ride";

  static const getActiveRide = "$baseUrl/api/get_active_ride";

  static const getAllRides = "$baseUrl/api/get_all_rides";

  static const addReview = "$baseUrl/api/add_review";

  static const getAllReviews = "$baseUrl/api/all_reviews";

  static const updateTip = "$baseUrl/api/addTip";

  static const updateUser = "$baseUrl/api/update_user";
}
