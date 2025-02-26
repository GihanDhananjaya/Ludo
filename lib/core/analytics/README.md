
# App Analytics Implementation for Flutter

This guide explain how to implement analytic tools to the existing flutter project.

Step 1 : Copy the analytics directory to the core of the project
Step 2 : Install necessary dependencies for analytical engines (Google Analytics, Mixpanel etc)

Step 3 : Update dependency injection classes and register AppAnalytics and other analytical engines.

''''
injection.registerLazySingleton<GoogleAnalyticsAdapter>(
      () => GoogleAnalyticsAdapter());
  injection.registerLazySingleton<MixpanelAdapter>(() => MixpanelAdapter());
  injection.registerSingleton<AppAnalytics>(
    AppAnalytics()
      ..addAnalyticsEngine(injection<GoogleAnalyticsAdapter>())
      ..addAnalyticsEngine(injection<MixpanelAdapter>()),
  );
''''

Step 4 : Initialize AppAnalytics in main.dart 

''''
  final analytics = injection<AppAnalytics>();
  analytics.initialize(config: {});
''''
