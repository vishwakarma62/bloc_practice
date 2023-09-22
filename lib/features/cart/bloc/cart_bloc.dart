import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cartItem.dart';
import 'package:bloc_practice/data/wishlistitem.dart';
import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartitemremoveEvent>(cartitemremoveEvent);
    on<WishlistitemaddfromcartEvent>(wishlistitemaddfromcartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartitemlist: cartitem));
  }

  FutureOr<void> cartitemremoveEvent(
      CartitemremoveEvent event, Emitter<CartState> emit) async {
    cartitem.remove(event.removeitem);
    emit(CartSuccessState(cartitemlist: cartitem));
    Future.delayed(Duration(seconds: 2));
    emit(CartitemremovedActionState());
  }

  FutureOr<void> wishlistitemaddfromcartEvent(
      WishlistitemaddfromcartEvent event, Emitter<CartState> emit)async {
    wishlisttitem.add(event.wishlistitemadd);
    emit(CartitemaddedtowishlistActionState());
  }
}
