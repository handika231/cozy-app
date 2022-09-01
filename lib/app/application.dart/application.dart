import 'package:cozy_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../model/space/space.dart';
import '../../pages/detail_page.dart';
import '../../pages/pages.dart';

// TODO :

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Cozy App',
      initialRoute: SplashScreen.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => const HomePage(),
        SplashScreen.nameRoute: (context) => const SplashScreen(),
        DetailPage.routeName: (context) => DetailPage(
              space: ModalRoute.of(context)?.settings.arguments as Space,
            ),
      },
    );
  }
}
