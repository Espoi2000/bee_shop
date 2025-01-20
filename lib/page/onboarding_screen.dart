import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/router/router.gr.dart';
import 'package:beep_shop/shared/product_in_my_whislist_tile.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "WishList",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: BouncingWId(
        //     widget: const ContainerNavigationPop(
        //       iconData: Ionicons.chevron_back,
        //     ),
        //     function: () {
        //       context.router.pop();
        //     },
        //   ),
        // ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
              return ProductInListTile(size: size);
            }),
      ),
    );
  }
}










// Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withAlpha(130),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(
//               Iconsax.arrow_left,
//             ),
//           ),
//         ),
//         actions: [
//           IconBadge(
//             icon: const Icon(
//               Iconsax.shopping_cart,
//             ),
//             itemCount: 5,
//             badgeColor: Colors.green,
//             itemColor: Colors.white,
//             hideZero: true,
//             onTap: () {
//               print('test');
//             },
//           ),
//         ],
//       ),
//       body: SizedBox(
//         width: size.width,
//         height: size.height,
//         child: Column(
//           children: [
//             Container(
//               height: size.height / 3,
//               width: size.width,
//               padding: EdgeInsets.all(8.0),
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/image3.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withAlpha(130),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(14),
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "3.5",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             // Spacer(),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 10,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: size.width / 2,
//                             child: const Text(
//                               "Les cookies publicitaires Vous pouvez retirer les cookie",
//                               softWrap: true,
//                               maxLines: 2,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           for (var i = 0; i < 5; i++)
//                             Icon(
//                               Icons.star,
//                               size: 18,
//                               color: i < 3 ? Colors.green : Colors.grey,
//                             )
//                         ],
//                       ),

//                       // description

//                       const Text(
//                         "Description : ",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                       const Text(
//                         "Les cookies publicitaires : ces cookies sont utilisés pour livrer des publicités qui sont pertinentes pour vous, en fonction de vos centres d’intérêts. Ils permettent également de limiter le nombre de fois où vous voyez une publicité. Ils sont habituellement placés sur le site par des réseaux",
//                         style: TextStyle(),
//                       ),
//                       const Text(
//                         "Usage : ",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                       const Text(
//                         "Les cookies publicitaires : ces cookies sont utilisés pour livrer des publicités qui sont pertinentes pour vous, en fonction de vos centres d’intérêts. Ils permettent également de limiter le nombre de fois où vous voyez une publicité. Ils sont habituellement placés sur le site par des réseaux publicitaires, avec la permission de l’opérateur du site Internet. Ces cookies se souviennent que vous avez visité certains sites, et ces informations sont partagées avec d’autres organisations, comme des régies publicitaires. Il est possible que ces cookies soient liés avec certaines ",
//                         style: TextStyle(),
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: size.width / 2 - 10,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 context.router.replace(const LoginRoute());
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 backgroundColor: Theme.of(context).primaryColor,
//                                 foregroundColor: Colors.white,
//                                 minimumSize: const Size(double.infinity, 48),
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(16)),
//                                 ),
//                               ),
//                               child: const Text("Commander"),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 context.router.replace(const LoginRoute());
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 backgroundColor: Colors.transparent,
//                                 side: BorderSide(
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                                 minimumSize: const Size(double.infinity, 48),
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(16)),
//                                 ),
//                               ),
//                               child: const Text("Ajouter au panier"),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );