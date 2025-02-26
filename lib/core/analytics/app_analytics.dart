import 'analytics_interface.dart';

class AppAnalytics implements AnalyticsInterface {
  final List<AnalyticsInterface> _analyticsEngines = [];

  /// Add an analytics engine to the manager
  void addAnalyticsEngine(AnalyticsInterface engine) {
    _analyticsEngines.add(engine);
  }

  /// Initialize all engines
  @override
  void initialize({required Map<String, dynamic> config}) {
    for (var engine in _analyticsEngines) {
      engine.initialize(config: config);
    }
  }

  /// Track events across all engines
  @override
  void trackEvent(String eventName, {Map<String, Object>? properties}) {
    for (var engine in _analyticsEngines) {
      engine.trackEvent(eventName, properties: properties);
    }
  }

  /// Log screen views across all engines
  @override
  void logScreenView(String screenName, {Map<String, Object>? properties}) {
    for (var engine in _analyticsEngines) {
      engine.logScreenView(screenName, properties: properties);
    }
  }

  /// Set user properties across all engines
  @override
  void setUserProperty(
      {required String userId, required String name, String? value}) {
    for (var engine in _analyticsEngines) {
      engine.setUserProperty(userId: userId, name: name, value: value);
    }
  }

  /// Track funnel steps across all engines
  @override
  void trackFunnelStep(String funnelName, String stepName,
      {Map<String, dynamic>? properties}) {
    for (var engine in _analyticsEngines) {
      engine.trackFunnelStep(funnelName, stepName, properties: properties);
    }
  }

  /// Log revenue across all engines
  @override
  void logPurchase(String productId, double amount,
      {Map<String, dynamic>? properties}) {
    for (var engine in _analyticsEngines) {
      engine.logPurchase(productId, amount, properties: properties);
    }
  }

  /// Log errors across all engines
  @override
  void logError(String errorName,
      {String? message, Map<String, Object>? properties}) {
    for (var engine in _analyticsEngines) {
      engine.logError(errorName, message: message, properties: properties);
    }
  }
}
