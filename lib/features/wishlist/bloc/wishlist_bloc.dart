import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cartItem.dart';
import 'package:bloc_practice/data/wishlistitem.dart';
import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistitemremoveEvent>(wishlistitemremoveEvent);
    on<CartItemaddfromwishlistWishlistEvent>(
        cartItemaddfromwishlistWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistitemlist: wishlisttitem));
  }

  FutureOr<void> cartItemaddfromwishlistWishlistEvent(
      CartItemaddfromwishlistWishlistEvent event, Emitter<WishlistState> emit) {
    cartitem.add(event.Wishlistitemadd);
    emit(wishlistitemaddedtoCartactionstate());
  }

  FutureOr<void> wishlistitemremoveEvent(
      WishlistitemremoveEvent event, Emitter<WishlistState> emit) async {
    wishlisttitem.remove(event.removeitem);
    emit(WishlistSuccessState(wishlistitemlist: wishlisttitem));
    Future.delayed(Duration(seconds: 2));
    emit(wishlistitemremovedActionState());
  }
}
