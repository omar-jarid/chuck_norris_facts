import 'package:chuck_norris_facts/di/datasource_module.dart';
import 'package:chuck_norris_facts/di/repository_module.dart';
import 'package:chuck_norris_facts/di/service_module.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class MainModule {
  void initialize(Injector injector) {
    ServiceModule.configure(injector);
    DatasourceModule.configure(injector);
    RepositoryModule.configure(injector);
  }
}