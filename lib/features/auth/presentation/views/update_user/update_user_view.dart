import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:easyjoob/features/auth/presentation/views/update_user/popups/pick_image_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/widgets/app_filled_button.dart';
import '../../../../../util/loading/loading.dart';
import '../../../../../util/resource/r.dart';
import '../../../../../util/toast/toast.dart';
import '../../providers/update_user_provider/image_provider.dart';
import '../../providers/update_user_provider/update_user_provider.dart';
import '../../providers/user_provider/user_provider.dart';

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends ConsumerState<UpdateUserView> {
  /// [Update User]
  Future<void> _updateUser({required String userId}) async {
    try {
      loading(context);
      final updatedUser = ref.watch(updatedProfileModelProvider);

      final output = await ref.read(
        updateUserProvider(updatedUser!).future,
      );
      ref.read(userProvider.notifier).setUser(output);
      showToast(msg: "Your profile has been updated");
    } catch (e) {
      showToast(msg: "Error updating profile");
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 18.h),
          child: Column(
            children: [
              /// [App Bar]
              Row(
                children: [
                  /// [Back Icon]
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.r,
                      weight: 2.r,
                    ),
                  ),

                  8.wb,

                  /// [Heading]
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),

              43.hb,

              Expanded(
                child: Consumer(
                  builder: (context, ref, _) {
                    final user = ref.watch(userProvider);
                    final image = ref.watch(imageProvider);

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          57.hb,

                          /// [User Image]
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              /// [Image]
                              image == null && user!.image == null
                                  ? CircleAvatar(
                                      backgroundColor: R.colors.white_FFF2F7FB,
                                      radius: 45.r,
                                      child: SvgPicture.asset(
                                          R.svgs.DEFAULT_USER_IMAGE),
                                    )
                                  : image == null
                                      ? CircleAvatar(
                                          backgroundColor:
                                              R.colors.white_FFF2F7FB,
                                          radius: 45.r,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  user!.image!),
                                        )
                                      : CircleAvatar(
                                          backgroundColor:
                                              R.colors.white_FFF2F7FB,
                                          radius: 45.r,
                                          backgroundImage: FileImage(
                                            File(image),
                                          ),
                                        ),

                              /// [Edit Icon]
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.r),
                                        topRight: Radius.circular(25.r),
                                      ),
                                    ),
                                    backgroundColor: R.colors.white_FFFFFFFF,
                                    builder: (context) {
                                      return const PickImageBottomSheet();
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: R.colors.orange_FFFE4B10,
                                  radius: 12.r,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15.r,
                                    color: R.colors.white_FFFFFFFF,
                                  ),
                                ),
                              )
                            ],
                          ),

                          4.hb,

                          /// [User Name]
                          Text(
                            user!.name!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          81.hb,

                          AppFilledButton(
                            text: "Update Profile",
                            onTap: () => _updateUser(userId: user.id),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
