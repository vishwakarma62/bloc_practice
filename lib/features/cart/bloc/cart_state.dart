// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
sealed class CartActionState extends CartState {}
final class CartInitial extends CartState {}
class CartSuccessState extends CartState {
  final List<ProductModel> cartitemlist;
  CartSuccessState({
    required this.cartitemlist,
  });


 }

 class CartitemremovedActionState extends CartActionState{}
  class CartitemaddedtowishlistActionState extends CartActionState{}