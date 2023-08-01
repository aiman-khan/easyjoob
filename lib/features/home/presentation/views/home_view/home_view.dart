import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/presentation/providers/user_provider/user_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final tipInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Consumer(
              builder: (context, ref, _) {
                final user = ref.watch(userProvider);

                return Stack(
                  alignment: Alignment.center,
                  children: [],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
