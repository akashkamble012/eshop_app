import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/domain/entities/fruit.dart';
part 'Orders.freezed.dart';
part 'Orders.g.dart';

@freezed
class Orders with _$Orders {
  // final String? orderId;
  // final List<Fruits>? items;
  // final double? totalPrice;
  // final double? discount;
  // final double? itemPerPrice;
  // final double? save;

  factory Orders({
    required String orderId,
    required List<Fruits> items,
    required double totalPrice,
    required double discount,
    required double itemPerPrice,
    required double save,
  }) = OrdersModel;

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  //
}
