import 'package:chuck_norris_facts/core/services/api_service.dart';
import 'package:chuck_norris_facts/di/abstract_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class ServiceModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<Dio>((i) => Dio(), isSingleton: true);
    injector.map<ApiService>((i) => ApiService(i.get<Dio>()), isSingleton: true);
  }
}