// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartitemremoveEvent extends CartEvent {
  final ProductModel removeitem;
  CartitemremoveEvent({
    required this.removeitem,
  });

}

class WishlistitemaddfromcartEvent extends CartEvent {
  final ProductModel wishlistitemadd;
  WishlistitemaddfromcartEvent({
    required this.wishlistitemadd,
  });


}

