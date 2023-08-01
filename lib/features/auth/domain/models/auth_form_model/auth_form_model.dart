class AuthFormModel {
  String? name;
  String? phoneNumber;
  String? companyName;
  String? userType;

  AuthFormModel({
    this.name,
    this.phoneNumber,
    this.companyName,
    this.userType,
  });

  AuthFormModel copyWith({
    String? name,
    String? phoneNumber,
    String? companyName,
    String? userType,
  }) {
    return AuthFormModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      companyName: companyName ?? this.companyName,
      userType: userType ?? this.userType,
    );
  }

  bool get isDriver => userType == "driver";
}
