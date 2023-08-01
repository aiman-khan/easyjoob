import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../util/di/di.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/set_user.dart';
import '../auth_form_provider/auth_form_provider.dart';
import '../user_provider/user_provider.dart';

final loginProvider = FutureProvider.autoDispose((ref) async {
  final loginUsecase = sl<LoginUsecase>();

  final authForm = ref.watch(authFormProvider);
  final phoneNumber = authForm.phoneNumber;

  if (phoneNumber != null && phoneNumber.isNotEmpty) {
    final input = LoginUsecaseInput(phoneNumber: phoneNumber);

    final output = await loginUsecase(input);

    final saveUserUsecase = sl<SetUserUsecase>();
    saveUserUsecase(SetUserUsecaseInput(user: output.user));
    ref.read(userProvider.notifier).setUser(output.user);
  }
});
