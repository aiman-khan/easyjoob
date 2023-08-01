enum UserType {
  driver,
  rider;

  String get name {
    if (this == UserType.driver) {
      return 'driver';
    } else {
      return 'rider';
    }
  }

  static UserType fromName(String name) {
    if (name == 'driver') {
      return UserType.driver;
    } else {
      return UserType.rider;
    }
  }
}
