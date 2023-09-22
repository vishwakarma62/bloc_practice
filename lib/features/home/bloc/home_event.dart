// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductwishlistClickedevent extends HomeEvent {
final ProductModel clickedproduct;
  HomeProductwishlistClickedevent({
    required this.clickedproduct,
  });


}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedproduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedproduct,
  });


}

class HomeProductwishlistButtonNavigateEvent extends HomeEvent{
  
}

class HomeProductCartButtonNavigateEvent extends HomeEvent{
  
}