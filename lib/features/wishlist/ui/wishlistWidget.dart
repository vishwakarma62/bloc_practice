import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistWidgetPage extends StatefulWidget {
  WishlistWidgetPage(
      {super.key, required this.wishlistitem, required this.wishlistBloc});
  final WishlistBloc wishlistBloc;
  ProductModel wishlistitem;

  @override
  State<WishlistWidgetPage> createState() => _WishlistWidgetPageState();
}

class _WishlistWidgetPageState extends State<WishlistWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${widget.wishlistitem.imgurl}")),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Random",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.13),
              ),
              Text(
                "${widget.wishlistitem.description}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text("\$",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Text("${widget.wishlistitem.price}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {
                widget.wishlistBloc.add(
                    CartItemaddfromwishlistWishlistEvent(Wishlistitemadd: widget.wishlistitem));
              },
              icon: Icon(Icons.shopping_bag_outlined)),
          IconButton(
              onPressed: () {
                widget.wishlistBloc.add(
                    WishlistitemremoveEvent(removeitem: widget.wishlistitem));
              },
              icon: Icon(Icons.remove_circle_rounded)),
        ],
      ),
    );
  }
}



// Container(
//       margin: EdgeInsets.all(6),
//       child: Row(
//         children: [
//           Container(
//             height: 60,
//             width: 70,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   fit: BoxFit.cover, image: NetworkImage(wishlistitem.imgurl)),
//             ),
//           ),
//           Spacer(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 wishlistitem.name,
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 0.13),
//               ),
//               Text(
//                 wishlistitem.description,
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 0.1),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20.0),
//                     child: Text("\$",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         )),
//                   ),
//                   Text(wishlistitem.price,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 ],
//               ),
//             ],
//           ),
//           Spacer(),
//           IconButton(
//               onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
//           IconButton(
//               onPressed: () {
//                 wishlistBloc
//                     .add(CartItemaddfromwishlistWishlistEvent(wishlistitem));
//               },
//               icon: Icon(Icons.shopping_bag_outlined)),
//           IconButton(
//               onPressed: () {
//                 wishlistBloc.add(WishlistitemremoveEvent(wishlistitem));
//               },
//               icon: Icon(Icons.remove_circle_rounded)),
//         ],
//       ),
//     );