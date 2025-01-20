import 'package:beep_shop/shared/update_quantities.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductInListTile extends StatelessWidget {
  const ProductInListTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Iconsax.close_circle,
            size: 15,
            color: Color.fromARGB(177, 84, 82, 82),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: size.width - 60,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.4,
                      spreadRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.3,
                      spreadRadius: 0.4,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/image3.jpg",
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bannane",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lorm ispum est unes librerie",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Dovv Mendong",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "5000 FCFA",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const SizedBox(
                      height: 120,
                      width: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UpdatequantitieProduct(
                            text: "+",
                          ),
                          Text(
                            "1012",
                            style: TextStyle(color: Colors.green),
                          ),
                          UpdatequantitieProduct(text: "-")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
