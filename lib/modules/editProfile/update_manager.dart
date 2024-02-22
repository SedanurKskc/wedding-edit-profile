import 'package:wedding/core/modules/alert/manager.dart';

class UpdateManager {
  Future<void> update(String adSoyad, String email, String cinsiyet, String dogumTarihi) async {
    await Future.delayed(const Duration(seconds: 1));
    AlertManager.instance.showSnack(SnackType.success, message: "Bilgiler update edildi.");
  }
}
