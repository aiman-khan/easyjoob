import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../util/di/di.dart';
import '../../../domain/usecases/register.dart';
import '../../../domain/usecases/set_user.dart';
import '../auth_form_provider/auth_form_provider.dart';
import '../user_provider/user_provider.dart';

final registerProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    final registerUsecase = sl<RegisterUsecase>();
    final setUserUsecase = sl<SetUserUsecase>();

    final authFormModel = ref.watch(authFormProvider);

    final registerUserInput = RegisterUsecaseInput(
      name: authFormModel.name!,
      phoneNumber: authFormModel.phoneNumber!,
      type: authFormModel.userType!,
      company: authFormModel.companyName,
    );

    final output = await registerUsecase(registerUserInput);

    /// [Save User in local database]
    final saveUserInput = SetUserUsecaseInput(user: output.user);
    await setUserUsecase(saveUserInput);

    ref.read(userProvider.notifier).setUser(output.user);
  },
);
