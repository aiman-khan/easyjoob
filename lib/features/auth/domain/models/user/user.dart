import '../../../data/entities/user/user.dart';

class User {
  final String id;
  final String name;
  final String? image;

  User({
    required this.id,
    required this.name,
    this.image,
  });

  User copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory User.fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      name: entity.name,
      image: entity.image,
    );
  }
}
