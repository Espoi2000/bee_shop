import 'package:beep_shop/features/categories/business_logic/bloc/category_bloc.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieWidget extends StatefulWidget {
  const CategorieWidget({super.key});

  @override
  State<CategorieWidget> createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          child: state is CategoryIsSucces
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String categorie = state.categories![index].categories;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.green
                              : Colors.green.withAlpha(
                                  20,
                                ),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                            color: currentIndex == index
                                ? Colors.green
                                : Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(categorie),
                        ),
                      ),
                    );
                  },
                )
              : state is CategoryIsLoading
                  ? const Center(
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                        ),
                      ),
                    )
                  : state is CategoryIsFailure
                      ? Center(
                          child: FilledButton(
                            style: Theme.of(context).textButtonTheme.style,
                            child: const Text('Refresh'),
                            onPressed: () {
                              getIt.get<CategoryBloc>().add(FectchCategory());
                            },
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
