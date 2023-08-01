class LocationModel {
  double latitude;
  double longitude;
  String formattedAddress;

  LocationModel({
    required this.longitude,
    required this.latitude,
    required this.formattedAddress,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      formattedAddress: json['formatted_address'] ?? "",
      latitude: json['geometry'] != null
          ? (json['geometry']['location']["lat"] ?? 0.0)
          : 0.0,
      longitude: json['geometry'] != null
          ? (json['geometry']['location']["lng"] ?? 0.0)
          : 0.0,
    );
  }
}
