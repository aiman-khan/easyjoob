import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../util/di/di.dart';
import '../../../domain/models/update_user_model/update_user_model.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/usecases/set_user.dart';
import '../../../domain/usecases/update_user.dart';
import '../user_provider/user_provider.dart';

final updateUserProvider =
    FutureProvider.autoDispose.family<User, UpdateUserModel>(
  (ref, updatedUserModel) async {
    final user = ref.watch(userProvider);

    final updateUserUsecase = sl<UpdateUserUsecase>();
    final setUserUsecase = sl<SetUserUsecase>();

    final input = UpdateUserUsecaseInput(
      userId: 0,
      image: updatedUserModel.image,
      name: updatedUserModel.name,
    );

    final output = await updateUserUsecase(input);
    await setUserUsecase(SetUserUsecaseInput(user: output.user));

    return output.user;
  },
);

final updatedProfileModelProvider =
    StateProvider<UpdateUserModel?>((ref) => null);
