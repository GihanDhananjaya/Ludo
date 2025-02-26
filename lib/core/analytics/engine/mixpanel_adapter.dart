// import 'package:flutter/foundation.dart';
// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
//
// import '../analytics_interface.dart';
//
// class MixpanelAdapter implements AnalyticsInterface {
//   Mixpanel? _mixpanel;
//
//   @override
//   Future<void> initialize({required Map<String, dynamic> config}) async {
//     final String token = config['token'];
//     if (token.isEmpty) {
//       throw ArgumentError('Mixpanel token is missing in configuration.');
//     }
//     _mixpanel = await Mixpanel.init(token, optOutTrackingDefault: false, trackAutomaticEvents: false);
//     if (kDebugMode) {
//       print('Mixpanel initialized successfully.');
//     }
//   }
//
//   @override
//   void trackEvent(String eventName, {Map<String, dynamic>? properties}) {
//     _mixpanel?.track(eventName, properties: properties);
//     if (kDebugMode) {
//       print('Mixpanel Event Tracked: $eventName');
//     }
//   }
//
//   @override
//   void logError(String errorName, {String? message, Map<String, dynamic>? properties}) {
//     _mixpanel?.track('Error: $errorName', properties: properties);
//     if (kDebugMode) {
//       print('Mixpanel Error Logged: $errorName');
//     }
//   }
//
//   @override
//   void logPurchase(String productId, double amount, {Map<String, dynamic>? properties}) {
//     final purchaseProperties = {
//       'productId': productId,
//       'amount': amount,
//       ...?properties,
//     };
//     _mixpanel?.track('app_purchase', properties: purchaseProperties);
//     if (kDebugMode) {
//       print('Mixpanel Purchase Logged: $productId');
//     }
//   }
//
//   @override
//   void logScreenView(String screenName, {Map<String, dynamic>? properties}) {
//     final screenProperties = {
//       'screen_name': screenName,
//       ...?properties,
//     };
//     _mixpanel?.track('screen_view', properties: screenProperties);
//     if (kDebugMode) {
//       print('Screen view logged: $screenName, properties: $properties');
//     }
//   }
//
//   @override
//   void setUserProperty({required String userId, required String name, String? value}) {
//     _mixpanel?.identify(userId);
//     _mixpanel?.getPeople().set(name, value);
//     if (kDebugMode) {
//       print('User property set: userId: $userId, $name: $value');
//     }
//   }
//
//   @override
//   void trackFunnelStep(String funnelName, String stepName, {Map<String, dynamic>?properties}) {
//     final funnelProperties = {
//       'funnel_name': funnelName,
//       'step_name': stepName,
//       ...?properties,
//     };
//     _mixpanel?.track('app_funnel', properties: funnelProperties);
//     if (kDebugMode) {
//       print('Funnel step tracked: funnelName: $funnelName, stepName: $stepName, properties: $properties');
//     }
//   }
// }
