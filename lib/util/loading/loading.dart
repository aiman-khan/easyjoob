import 'package:flutter/material.dart';

import '../resource/r.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white_FFFFFFFF.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: R.colors.orange_FFFE4B10,
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
