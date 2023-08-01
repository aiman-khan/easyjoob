class Env {
  const Env._();

  static const String stripePublishableKey = String.fromEnvironment('stripePublishKey');
  static const String stripeSecret = String.fromEnvironment('stripeSecretKey');
}
