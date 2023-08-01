import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_image_generator/qr_image_generator.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';
import '../qr_generator_helper.dart';

@lazySingleton
class QrGeneratorUseCase
    implements Usecase<QrGeneratorUseCaseInput, QrGeneratorUseCaseOutput> {
  final QrGeneratorHelper qrCodeScannerHelper;

  QrGeneratorUseCase({required this.qrCodeScannerHelper});

  @override
  Future<QrGeneratorUseCaseOutput> call(QrGeneratorUseCaseInput input) async {
    return await qrCodeScannerHelper.qrGenerator(input);
  }
}

class QrGeneratorUseCaseInput extends Input {
  final String data;
  final String filePath;
  final int? scale;
  final Color? foregroundColor;
  final Color? backgroundColor;
  ErrorCorrectionLevel? errorCorrectionLevel = ErrorCorrectionLevel.medium;
  final int? qrVersion;

  QrGeneratorUseCaseInput({
    required this.data,
    required this.filePath,
    this.scale,
    this.foregroundColor,
    this.backgroundColor,
    this.errorCorrectionLevel,
    this.qrVersion,
  });
}

class QrGeneratorUseCaseOutput extends Output {
  late final String filePath;

  QrGeneratorUseCaseOutput({required this.filePath});
}
