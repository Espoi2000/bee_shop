import 'package:beep_shop/boostrap.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/shared/application.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  setupLocator();



  
  await boostrap(
    () => MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt.get<AuthBloc>(),
      ),
    ], child: const Application()),
  );
}
