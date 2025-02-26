abstract class AnalyticsInterface {
  void initialize({required Map<String, dynamic> config});
  void trackEvent(String eventName, {Map<String, Object>? properties});
  void logScreenView(String screenName, {Map<String, Object>? properties});
  void setUserProperty({required String userId, required String name, String? value});
  void trackFunnelStep(String funnelName, String stepName, {Map<String, dynamic>? properties});
  void logPurchase(String productId, double amount, {Map<String, dynamic>? properties});
  void logError(String errorName, {String? message, Map<String, Object>? properties});
}
