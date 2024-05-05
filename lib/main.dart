import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/injection.dart';
import 'package:youtube_clone/views/pages/main_page.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Call init to register dependencies

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      // initialBinding: BindingsBuilder(() {
      //   Get.put(SelectedVideoController());
      //    Get.put(SelectedVideoController());
      // }),
      title: 'YouTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: const MainPage(),
    );
  }
}
