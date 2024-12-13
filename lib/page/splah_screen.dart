import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/router/router.gr.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.router.replace(const OnboardingRoute());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var trans = AppLocalizations.of(context);
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 31, 88, 33),
              Colors.black,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Beep Shop",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 3,
              width: 30,
              child: const LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
