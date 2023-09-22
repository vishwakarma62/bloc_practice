import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/cart/ui/cartwisget.dart';
import 'package:bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlistWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistState();
}

class _WishlistState extends State<WishlistPage> {
   final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "wishlist Item",
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, State) {
            switch (State.runtimeType) {
              case WishlistSuccessState:
                final successstate = State as WishlistSuccessState;
                return ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    //physics: ,
                    itemBuilder: (context, index) {
                      return WishlistWidgetPage(
                          wishlistBloc: wishlistBloc,
                        // item: homebloc,
                          wishlistitem: successstate.wishlistitemlist[index]);
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
                    itemCount: successstate.wishlistitemlist.length);

              default:
                return SizedBox();
            }
          },
          listener: (context, State) {
            if (State is wishlistitemaddedtoCartactionstate) {
              Fluttertoast.showToast(
                  msg: "added to Cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (State is wishlistitemremovedActionState) {
              Fluttertoast.showToast(
                  msg: "removed",
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
