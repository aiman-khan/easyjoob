import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user/user.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }

  User get getUser => state!;
}

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());
