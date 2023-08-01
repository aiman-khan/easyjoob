import 'qr_generator_use_cases/qr_generator_use_case.dart';

abstract class QrGeneratorHelper {
  Future<QrGeneratorUseCaseOutput> qrGenerator(QrGeneratorUseCaseInput input);
}
