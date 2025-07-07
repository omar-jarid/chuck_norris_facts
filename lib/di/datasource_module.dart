import 'package:chuck_norris_facts/core/services/api_service.dart';
import 'package:chuck_norris_facts/data/datasources/network_datasource.dart';
import 'package:chuck_norris_facts/di/abstract_module.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class DatasourceModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<NetworkDataSource>(
      (i) => NetworkDataSourceImpl(i.get<ApiService>()),
      isSingleton: true
    );
  }
}