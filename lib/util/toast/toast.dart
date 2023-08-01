import 'package:fluttertoast/fluttertoast.dart';

import '../resource/r.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.white_FFFFFFFF,
    backgroundColor: R.colors.orange_FFFE4B10,
  );
}
