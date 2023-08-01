import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/di/di.dart';
import '../../../../../util/resource/r.dart';
import '../../../../auth/data/local/auth_local_datasource_imp.dart';
import '../../../../auth/domain/usecases/get_user.dart';
import '../../../../auth/presentation/providers/user_provider/user_provider.dart';
import '../../../domain/usecases/is_fresh.dart';
import '../../../domain/usecases/set_unfresh.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 2));

    final isFreshUsecase = sl<IsFreshUsecase>();
    final isFresh = await isFreshUsecase(IsFreshUsecaseInput());

    if (mounted) {
      if (isFresh.isFreshInstall) {
        Navigator.of(context).pushReplacementNamed('/onboard');
      } else {
        try {
          final getUserUsecase = sl<GetUserUsecase>();

          final output = await getUserUsecase(GetUserUsecaseInput());

          ref.read(userProvider.notifier).setUser(output.user);

          if (mounted) Navigator.of(context).pushReplacementNamed('/home');
        } on NotLoginException {
          Navigator.of(context).pushReplacementNamed('/register');
        }
      }
    }
    await setOnFresh();
  }

  Future<void> setOnFresh() async {
    final setUnfreshUsecase = sl<SetUnfreshUsecase>();
    await setUnfreshUsecase(SetUnfreshUsecaseInput());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Image.asset(
          R.pngs.SPLASH,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
