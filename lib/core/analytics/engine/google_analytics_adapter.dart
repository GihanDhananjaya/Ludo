// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/foundation.dart';
//
// import '../analytics_interface.dart';
//
// class GoogleAnalyticsAdapter implements AnalyticsInterface {
//   FirebaseAnalytics? _analytics;
//
//   @override
//   void initialize({required Map<String, dynamic> config}) {
//     _analytics = FirebaseAnalytics.instance;
//     _analytics?.logAppOpen();
//   }
//
//   @override
//   void trackEvent(String eventName, {Map<String, Object>? properties}) {
//     _analytics?.logEvent(
//       name: eventName,
//       parameters: properties,
//     );
//     if (kDebugMode) {
//       print("Logged event to Google Analytics: $eventName");
//     }
//   }
//
//   @override
//   void logError(String errorName,
//       {String? message, Map<String, Object>? properties}) {
//     _analytics?.logEvent(name: "Error: $errorName", parameters: properties);
//     if (kDebugMode) {
//       print(
//           "Logged error: $errorName with description: $message and metadata: $properties");
//     }
//   }
//
//   @override
//   void logPurchase(String productId, double amount,
//       {Map<String, dynamic>? properties}) {
//     _analytics?.logEvent(
//       name: 'app_purchase',
//       parameters: {
//         'productId': productId,
//         'value': amount,
//         if (properties != null) ...properties,
//       },
//     );
//     if (kDebugMode) {
//       print(
//           "Logged Purchase: Product ID : $productId with metadata: $properties");
//     }
//   }
//
//   @override
//   void logScreenView(String screenName, {Map<String, Object>? properties}) {
//     _analytics?.logScreenView(
//         screenName: screenName,
//         screenClass: screenName,
//         parameters: properties);
//     if (kDebugMode) {
//       print("Logged screen view: $screenName");
//     }
//   }
//
//   @override
//   void setUserProperty(
//       {required String userId, required String name, String? value}) {
//     _analytics?.setUserId(id: userId);
//     _analytics?.setUserProperty(
//       name: name.substring(0, 24),
//       value: value,
//     );
//
//     if (kDebugMode) {
//       print("Set user ID: $userId");
//       print("Set user property: $name = $value");
//     }
//   }
//
//   @override
//   void trackFunnelStep(String funnelName, String stepName,
//       {Map<String, dynamic>? properties}) {
//     _analytics?.logEvent(
//       name: "app_funnel",
//       parameters: {
//         "funnel_name": funnelName,
//         "step_name": stepName,
//         ...?properties,
//       },
//     );
//     if (kDebugMode) {
//       print("Tracked funnel step: $stepName with metadata: $properties");
//     }
//   }
// }
