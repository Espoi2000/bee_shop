import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/router/router.gr.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
       const Duration(seconds: 5),
      () async {
          context.router.replace(const OnboardingRoute());
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // String? accessToken = prefs.getString("accessToken");
        // int? id = prefs.getInt("id");
        // if (accessToken != null && id != null) {
        //   getIt.get<AuthBloc>().add(GetCurrentUserEvent());
        // } else {
          
        // }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var trans = AppLocalizations.of(context);
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CurrentAuthUserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const Text(
                  'WellCome Back !',
                  style: TextStyle(color: Colors.white),
                ),
                duration: const Duration(seconds: 5), // Durée d'affichage
              ),
            );
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        child: Container(
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state is CurrentAuthUserLoading
                      ? const SizedBox(
                          height: 3,
                          width: 30,
                          child: LinearProgressIndicator(),
                        )
                      : state is CurrentAuthUserFailure
                          ? ElevatedButton(
                              onPressed: () {
                                getIt
                                    .get<AuthBloc>()
                                    .add(GetCurrentUserEvent());
                              },
                              child: const Text('Refresh'),
                            )
                          : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
