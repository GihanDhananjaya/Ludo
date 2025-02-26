import '../../utils/enums.dart';
import '../configurations/app_config.dart';

const CONNECT_TIMEOUT = 60 * 1000;
const RECEIVE_TIMEOUT = 60 * 1000;

class IPAddress {
  static const String DEV = 'disegame.aventureit.com/';
  static const String LIVE = 'disegame.aventureit.com/';
}

class ServerProtocol {
  static const String DEV = 'https://';
  static const String LIVE = 'https://';
}

class ContextRoot {
  static const String DEV = 'api/';
  static const String LIVE = 'api/';
}

class NetworkConfig {
  static String getNetworkUrl() {
    String url = _getProtocol() + _getIP() + _getContextRoot();
    return url;
  }

  static String _getContextRoot() {
    if (AppConfig.flavor == Flavor.DEV) {
      return ContextRoot.DEV;
    } else {
      return ContextRoot.LIVE;
    }
  }

  static String _getProtocol() {
    if (AppConfig.flavor == Flavor.DEV) {
      return ServerProtocol.DEV;
    } else {
      return ServerProtocol.LIVE;
    }
  }

  static String _getIP() {
    if (AppConfig.flavor == Flavor.DEV) {
      return IPAddress.DEV;
    } else {
      return IPAddress.LIVE;
    }
  }
}
