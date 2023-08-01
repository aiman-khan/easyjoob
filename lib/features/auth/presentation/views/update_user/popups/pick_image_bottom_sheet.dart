import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../infrastructure/usecase_input.dart';
import '../../../../../../util/di/di.dart';
import '../../../../../../util/resource/r.dart';
import '../../../../domain/models/update_user_model/update_user_model.dart';
import '../../../../domain/usecases/pick_camera_image_usecase.dart';
import '../../../../domain/usecases/pick_gallery_image_usecase.dart';
import '../../../providers/update_user_provider/image_provider.dart';
import '../../../providers/update_user_provider/update_user_provider.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.r),
      child: Consumer(
        builder: (context, ref, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  final pickCameraImageUsecase = sl<PickCameraImageUsecase>();
                  final image = await pickCameraImageUsecase(NoInput());
                  ref.read(imageProvider.notifier).state = image;
                  if (context.mounted) Navigator.pop(context);
                },
                leading: Icon(
                  Icons.photo_camera,
                  size: 24.r,
                ),
                title: Text(
                  "Camera",
                  style: TextStyle(
                    color: R.colors.black_FF000000,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.sp,
                ),
              ),
              ListTile(
                onTap: () async {
                  final pickGalleryImageUsecase = sl<PickGalleryImageUsecase>();
                  final image = await pickGalleryImageUsecase(NoInput());
                  ref.read(imageProvider.notifier).state = image;

                  ref.read(updatedProfileModelProvider.notifier).state =
                      UpdateUserModel(image: image);
                  if (context.mounted) Navigator.pop(context);
                },
                leading: Icon(
                  Icons.photo,
                  size: 24.r,
                ),
                title: Text(
                  "Gallery",
                  style: TextStyle(
                    color: R.colors.black_FF000000,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.sp,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
