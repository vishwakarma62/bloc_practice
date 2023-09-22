import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cartItem.dart';
import 'package:bloc_practice/data/grocerry_data.dart';
import 'package:bloc_practice/data/wishlistitem.dart';
import 'package:bloc_practice/features/home/models/home_product_datamodel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductwishlistClickedevent>(homeProductwishlistClickedevent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductwishlistButtonNavigateEvent>(
        homeProductwishlistButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("HomeInitialEvent");
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        product: GrossaryData.groceryProducts
            .map((e) => ProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                imgurl: e['imageUrl'],
                price: e['price']))
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductwishlistClickedevent(
      HomeProductwishlistClickedevent event, Emitter<HomeState> emit) {
    print("wishlist product button clicked");
    wishlisttitem.add(event.clickedproduct);
    print(event.clickedproduct.id);
    print(event.clickedproduct.name);
    print(wishlisttitem.length);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart product button clicked");
    cartitem.add(event.clickedproduct);
    print(event.clickedproduct.id);
    print(event.clickedproduct.name);
    print(cartitem.length);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductwishlistButtonNavigateEvent(
      HomeProductwishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist navigate button clicked");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate button clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
