import 'package:beep_shop/router/router.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 31, 88, 33),
        ),
        useMaterial3: true,
      ),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // locale: const Locale("fr"),
      // supportedLocales: AppLocalizations.supportedLocales,
    );
    ;
  }
}
