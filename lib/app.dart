import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/alice/alice_get_connect.dart';
import 'package:flutter_getx_template/feature/main/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        child: OverlaySupport.global(
          child: GetMaterialApp(
            title: 'Flutter Template',
            navigatorKey: kDebugMode ? Get.find<AliceGetConnect>().getNavigatorKey() : null,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                textTheme: Typography(platform: TargetPlatform.iOS).black.apply(
                    fontFamily: GoogleFonts.poppins().fontFamily)),
            home: const MainScreen(),
          ),
        ));
  }
}
