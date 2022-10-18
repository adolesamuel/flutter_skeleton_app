// API base url

import '../../configs/environment.dart';

class Endpoint {
  // API base Url
  //TODO: update as required
  static final String _base = Environment.baseUrl;

  // Authentication Endpoint//////////////////////////////////
  /// Login
  static final loginEndpoint = '$_base/callstuff/';
}
