import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/cart/ui/cartwisget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "Cart Item",
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, State) {
            switch (State.runtimeType) {
              case CartSuccessState:
                final successstate = State as CartSuccessState;
                return ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    //physics: ,
                    itemBuilder: (context, index) {
                      return CartWidgetPage(
                          cartBloc: cartBloc,
                          // item: homebloc,
                          item: successstate.cartitemlist[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(.6),
                        ),
                      );
                    },
                    itemCount: successstate.cartitemlist.length);

              default:
                return SizedBox();
            }
          },
          listener: (context, State) {
            if (State is CartitemremovedActionState) {
              Fluttertoast.showToast(
                  msg: "removed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (State is CartitemaddedtowishlistActionState) {
              Fluttertoast.showToast(
                  msg: "added to wishlist",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }),
    );
  }
}
