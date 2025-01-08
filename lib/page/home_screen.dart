/*************  ✨ Codeium Command ⭐  *************/
import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Text(state.auth!.toJson());
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/login');
              },
              child: const Text('Go to login screen'),
            ),
          ],
        ),
      ),
    );
  }
}
