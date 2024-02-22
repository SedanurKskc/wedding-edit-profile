import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'core/base/util/color.dart';
import 'core/modules/alert/manager.dart';
import 'core/modules/memory/memory_manager.dart';
import 'core/modules/navigate/manager.dart';
import 'core/modules/provider/manager.dart';
import 'product/splash/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManager.instance.init();
  initializeDateFormatting('tr_TR');
  runApp(
    MultiProvider(
      providers: [...ProviderManager.instance.dependItems],
      child: const WeddingApp(),
    ),
  );
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    prepareSystem();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wedding",
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      navigatorKey: NavigationManager.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      scaffoldMessengerKey: AlertManager.instance.scaffoldMessengerKey,
      home: const SplashView(),
    );
  }

  prepareSystem() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: ColorUtility.background);
  }
}
