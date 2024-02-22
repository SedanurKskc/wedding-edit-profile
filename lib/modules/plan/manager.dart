import 'package:wedding/core/setup.dart';

import 'plan_model.dart';
export 'plan_model.dart';

class PlanModelManager {
  final ApplicationSetup _setup = ApplicationSetup.instance;
  List<Map<String, dynamic>> mockPlans = [
    {"id": 1, "header": "Düğün tarihine karar ver", "value": true, "parent": "Adım 1"},
    {"id": 2, "header": "Davetli sayını belirle", "value": false, "parent": "Adım 1"},
    {"id": 3, "header": "Düğün mekanını bul", "value": false, "parent": "Adım 1"},
    {"id": 4, "header": "Düğün konseptini belirle", "value": true, "parent": "Adım 2"},
    {"id": 5, "header": "Balayı otelini ayarla", "value": false, "parent": "Adım 2"},
    {"id": 6, "header": "Saç modellerine göz at", "value": false, "parent": "Adım 2"},
    {"id": 7, "header": "Davetiyeleri bastır", "value": false, "parent": "Adım 3"},
    {"id": 8, "header": "Düğün müziklerini seç", "value": false, "parent": "Adım 3"},
    {"id": 9, "header": "Nikah Şekerini Yaptır", "value": false, "parent": "Adım 3"},
    {"id": 10, "header": "Evlilik Tarihi Al", "value": false, "parent": "Adım 3"},
  ];

  Future<List<PlanModel>> getPlans() async {
    await Future.delayed(const Duration(seconds: 1));
    return switch (_setup.appMode) {
      AppMode.dev => mockPlans.map<PlanModel>((e) => PlanModel.fromJson(e)).toList(),
      AppMode.test => mockPlans.map<PlanModel>((e) => PlanModel.fromJson(e)).toList(),
      AppMode.product => mockPlans.map<PlanModel>((e) => PlanModel.fromJson(e)).toList(),
    };
  }
}
