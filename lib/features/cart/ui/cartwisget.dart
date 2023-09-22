import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:flutter/material.dart';

class CartWidgetPage extends StatelessWidget {
  CartWidgetPage({super.key, required this.item, required this.cartBloc});
  ProductModel item;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(item.imgurl)),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.13),
              ),
              Text(
                item.description,
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
                  Text(item.price,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                cartBloc
                    .add(WishlistitemaddfromcartEvent(wishlistitemadd: item));
              },
              icon: Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                cartBloc.add(CartitemremoveEvent(removeitem: item));
              },
              icon: Icon(Icons.shopping_bag)),
        ],
      ),
    );
  }
}
