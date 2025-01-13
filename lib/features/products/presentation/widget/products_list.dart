import 'package:beep_shop/features/products/logic/bloc/product_bloc.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';

class ProdutcsListView extends StatelessWidget {
  const ProdutcsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state is GetAllProductSucces
            ? SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: state.products!.length,
                  // itemCount: 10,

                  itemBuilder: (BuildContext context, int index) {
                    var product = state.products[index];
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0B000000),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 100,
                                width: MediaQuery.sizeOf(context).width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: CachedNetworkImage(
                                    imageUrl: product.images.first,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    placeholder: (context, url) => const Center(
                                      child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  icon: const Icon(Iconsax.heart),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Text(
                                  product.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  "Xaf : ${product.price}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            product.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:const  TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            : state is GetAllProductLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  )
                : Center(
                    child: FilledButton(
                      style: Theme.of(context).textButtonTheme.style,
                      child: const Text('Refresh'),
                      onPressed: () {
                        getIt
                            .get<ProductBloc>()
                            .add(GetAllProductsEvent(limit: 10));
                      },
                    ),
                  );
      },
    );
  }
}
