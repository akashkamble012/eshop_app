import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/features/product/domain/entities/fruit.dart';
import 'package:get/get.dart';

class ProducttController extends GetxController {
  List _allProducct = <Fruits>[];

  List<Fruits> get allProduct {
    return [..._allProducct];
  }

  List<Fruits> get bannerProduct {
    return [
      ..._allProducct.sublist(
          (_allProducct.length / 2).floor(), _allProducct.length)
    ];
  }

  Future<void> getAllProduct() async {
    FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;
    var allData = await _fireBaseStore.collection('/AllProduct').get();
    print('========== $allData');
    allData.docs.forEach(
      (items) {
        _allProducct.add(
          Fruits(
            id: items.id,
            name: items['name'],
            price: items['price'],
            offer: items['offer'],
            unit: items['unit'],
            aboutTheProduct: [...items['aboutTheProdut']],
            benefits: [...items['benefits']],
            description: items['description'],
            storageAndUses: [...items['storageAndUses']],
            imageUrl: items['imageUrl'],
            images: [...items['image']],
          ),
        );
      },
    );
  }
}
