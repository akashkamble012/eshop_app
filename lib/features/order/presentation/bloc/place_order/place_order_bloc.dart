import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/Orders.dart';
import '../../../domain/usecases/get_order.dart';
import '../../../domain/usecases/put_order.dart';

part 'place_order_bloc.freezed.dart';
part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  final PutOrder putOrder;
  final GetOrder getOrder;
  PlaceOrderBloc(this.putOrder, this.getOrder) : super(const Init()) {
    on<PlaceOrderPutEvent>(placeOrderPutEvent);
    on<PlaceOrderGetEvent>(placeOrderGetEvent);
  }

  void placeOrderPutEvent(PlaceOrderPutEvent event, emit) async {
    emit(const PlaceOrderLoadingState());
    final result = await putOrder(event.orders, event.userId);
    emit(const PlaceOrderSuccessState());
    print('------ $result');
  }

  void placeOrderGetEvent(PlaceOrderGetEvent event, emit) async {
    emit(const PlaceOrderLoadingState());
    final result = await getOrder('');
    result.fold((failure) {
      emit(PlaceOrderErrorState(message: failure.message));
    }, (success) {
      emit(PlaceOrderLoadedState(cartItems: success.reversed.toList()));
    });
  }
}
