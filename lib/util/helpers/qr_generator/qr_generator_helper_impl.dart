import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_image_generator/qr_image_generator.dart';

import 'qr_generator_helper.dart';
import 'qr_generator_use_cases/qr_generator_use_case.dart';

@LazySingleton(as: QrGeneratorHelper)
class QrGeneratorHelperImpl implements QrGeneratorHelper {
  final generator = QRGenerator();

  @override
  Future<QrGeneratorUseCaseOutput> qrGenerator(
      QrGeneratorUseCaseInput input) async {
    final data = await generator.generate(
      data: input.data,
      filePath: input.filePath,
      scale: 10,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      errorCorrectionLevel: ErrorCorrectionLevel.medium,
      qrVersion: 4,
    );

    await Future.delayed(const Duration(milliseconds: 100));
    return QrGeneratorUseCaseOutput(
      filePath: data,
    );
  }
}
