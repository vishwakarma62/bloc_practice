part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccessState extends WishlistState {
  final List<ProductModel> wishlistitemlist;

  WishlistSuccessState({required this.wishlistitemlist});
}

class wishlistitemaddedtoCartactionstate extends WishlistActionState {}

class wishlistitemremovedActionState extends WishlistActionState {}
