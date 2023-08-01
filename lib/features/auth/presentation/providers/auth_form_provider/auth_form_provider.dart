import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/auth_form_model/auth_form_model.dart';

class _AuthFormModelNotifier extends StateNotifier<AuthFormModel> {
  _AuthFormModelNotifier() : super(AuthFormModel());

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void setCompanyName(String companyName) {
    state = state.copyWith(companyName: companyName);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setUserType(String userType) {
    state = state.copyWith(userType: userType);
  }

  AuthFormModel get authFormModel => state;
}

final authFormProvider =
    StateNotifierProvider<_AuthFormModelNotifier, AuthFormModel>(
  (ref) => _AuthFormModelNotifier(),
);
