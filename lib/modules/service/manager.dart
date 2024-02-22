import 'package:wedding/core/setup.dart';
import 'service_model.dart';
export 'service_model.dart';

class ServiceModelManager {
  final ApplicationSetup _setup = ApplicationSetup.instance;
  ServiceModel model = ServiceModel();

  List<Map<String, dynamic>> mockSideList = [
    {"id": 1, "header": "Kapasite", "value": "200-500"},
    {"id": 2, "header": "Kameraman", "value": "Yok"},
    {"id": 3, "header": "Müzisyen", "value": "Var"},
    {"id": 4, "header": "Depozito", "value": "1000 ₺"},
    {"id": 5, "header": "Açık Alan", "value": "Yok"},
    {"id": 6, "header": "Kapalı Alan", "value": "Var"},
    {"id": 7, "header": "Akollü İçecek", "value": "Yok"},
  ];

  List<Map<String, dynamic>> mockMainList = [
    {"id": 8, "header": "Lokasyon", "value": "Sarıyer / İstanbul"},
    {"id": 9, "header": "Puan", "value": "5.0"},
  ];

  Future<List<ServiceModel>> getSideServices() async {
    await Future.delayed(const Duration(seconds: 1));
    return switch (_setup.appMode) {
      AppMode.dev => mockSideList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
      AppMode.test => mockSideList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
      AppMode.product => mockSideList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
    };
  }

  Future<List<ServiceModel>> getMainServices() async {
    await Future.delayed(const Duration(seconds: 1));
    return switch (_setup.appMode) {
      AppMode.dev => mockMainList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
      AppMode.test => mockMainList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
      AppMode.product => mockMainList.map<ServiceModel>((e) => model.fromJson(e)).toList(),
    };
  }
}
