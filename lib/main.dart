import 'package:beep_shop/boostrap.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/features/categories/business_logic/bloc/category_bloc.dart';
import 'package:beep_shop/features/products/logic/bloc/product_bloc.dart';
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
      BlocProvider(
        create: (context) => getIt.get<CategoryBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt.get<ProductBloc>(),
      )
    ], child: const Application()),
  );
}
