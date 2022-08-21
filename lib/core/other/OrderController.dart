import 'package:eshop/features/product/domain/entities/fruit.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var _orders = [];

  Future<void> addCart(Fruits fruits) async {
    if (_orders.length == 0) {
      _orders.add(fruits);
      update();
    } else {
      // print('${fruits.id}   $_orders');
      bool _isContain = _orders.any((fru) => fru.id == fruits.id);

      // print(_isContain);
      if (!_isContain) {
        _orders.add(fruits);
        update();
      }
    }
  }

  Future<void> remove({String? id}) async {
    var _productIndex = _orders.lastIndexWhere((element) => element.id == id);
    _orders.removeAt(_productIndex);
    update();
  }

  List<Fruits> get orders {
    return [..._orders.reversed];
  }

  double get actuallPrice {
    return _orders.fold(
        0, (previousValue, element) => (element.price + previousValue));
  }

  double get total {
    return _orders.fold(
        0, (previousValue, element) => (element.offPrice + previousValue));
  }

  double get saveing {
    return _orders.fold(
        0, (previousValue, element) => (element.save + previousValue));
  }

  double get offer {
    return _orders.fold(
        0, (previousValue, element) => (element.offer + previousValue));
  }

  Future<void> removeAll() async {
    _orders = [];
    update();
  }

//
}
