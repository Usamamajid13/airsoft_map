import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pubg_map/map_values_class.dart';
import 'constants.dart';
import 'splash_screen.dart';
import 'category_selection_page.dart';
import 'soldier_home_screen.dart';
import 'soldier_map_screen.dart';
import 'admin_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySystemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: Colors.black);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return MaterialApp(
      title: 'Pubg_map',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashScreen(),
        categorySelectionScreenRoute: (context) =>
            const CategorySelectionPage(),
        soldierHomeScreen: (context) => const SoldierHomeScreen(),
        soldierMapScreenRoute: (context) {
          var i = ModalRoute.of(context)!.settings.arguments;
          return SoldierMapScreen(i);
        },
        adminHomeScreenRoute: (context) => const AdminHomeScreen(),
      },
    );
  }
}
