/*************  ✨ Codeium Command ⭐  *************/
import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/features/categories/business_logic/bloc/category_bloc.dart';
import 'package:beep_shop/features/categories/presentation/categorie_widget.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getIt.get<CategoryBloc>().add(FectchCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(8.0),
        child: const SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              CategorieWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
