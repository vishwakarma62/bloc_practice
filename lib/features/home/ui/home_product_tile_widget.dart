import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class HomeProducttileWisget extends StatelessWidget {
  HomeProducttileWisget(
      {super.key, required this.homeproduct, required this.homeBloc});
  ProductModel homeproduct;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             // height: ,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(homeproduct.imgurl,fit: BoxFit.cover,),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeproduct.name,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    homeproduct.description,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.13),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        homeproduct.price,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                print(homeBloc);
                                homeBloc.add(HomeProductwishlistClickedevent(
                                    clickedproduct: homeproduct));
                              },
                              icon: Icon(Icons.favorite_border)),
                          IconButton(
                              onPressed: () {
                                homeBloc.add(HomeProductCartButtonClickedEvent(
                                   clickedproduct:  homeproduct));
                              },
                              icon: Icon(Icons.shopping_bag_outlined)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





// Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 255,
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage("${widget.homeproduct.imgurl}"))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${widget.homeproduct.name}",
//                     style: TextStyle(
//                         fontSize: 20,
//                         letterSpacing: 0.1,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   Text(
//                     "${widget.homeproduct.description}",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 0.13),
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 16.0),
//                         child: Text(
//                           "\$",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "${widget.homeproduct.price}",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Spacer(),
//                       Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 homebloc.add(HomeProductwishlistClickedevent(
//                                     widget.homeproduct));
//                               },
//                               icon: Icon(Icons.favorite_border)),
//                           IconButton(
//                               onPressed: () {
//                                 homebloc.add(
//                                     HomeProductCartButtonClickedEvent(
//                                         widget.homeproduct));
//                               },
//                               icon: Icon(Icons.shopping_bag_outlined)),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );