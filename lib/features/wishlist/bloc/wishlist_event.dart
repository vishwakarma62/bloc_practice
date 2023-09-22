// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class CartItemaddfromwishlistWishlistEvent extends WishlistEvent {
  final ProductModel Wishlistitemadd;
  CartItemaddfromwishlistWishlistEvent({
    required this.Wishlistitemadd,
  });


}

class WishlistitemremoveEvent extends WishlistEvent {
  final ProductModel removeitem;
  WishlistitemremoveEvent({
    required this.removeitem,
  });
}
