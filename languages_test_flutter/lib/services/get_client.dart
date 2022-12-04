import 'package:languages_test_client/languages_test_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class GetClient {
  static final _client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  static Client getClient() => _client;
}
