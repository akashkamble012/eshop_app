part of 'place_order_bloc.dart';

@freezed
class PlaceOrderState with _$PlaceOrderState {
  const factory PlaceOrderState.initial() = Init;
  const factory PlaceOrderState.placeOrderLoadedState({required List<Orders> cartItems}) = PlaceOrderLoadedState;
  const factory PlaceOrderState.placeOrderLoadingState() = PlaceOrderLoadingState;
  const factory PlaceOrderState.placeOrderSuccess() = PlaceOrderSuccessState;
  const factory PlaceOrderState.placeOrderErrorState({required String message}) = PlaceOrderErrorState;
}
