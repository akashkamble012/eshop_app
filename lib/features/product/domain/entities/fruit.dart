import 'package:freezed_annotation/freezed_annotation.dart';
part 'fruit.freezed.dart';
part 'fruit.g.dart';

@freezed
class Fruits with _$Fruits {
  factory Fruits({
    String? name,
    String? id,
    String? description,
    String? unit,
    double? price,
    double? offPrice,
    double? offer,
    double? save,
    String? imageUrl,
    List<String>? images,
    List<String>? aboutTheProduct,
    List<String>? benefits,
    List<String>? storageAndUses,
  }) = FruitsModel;

  factory Fruits.fromJson(Map<String, dynamic> json) => _$FruitsFromJson(json);

  // final String? name;
  // final String id;
  // final String? description;
  // final String? unit;
  // final double? price;
  // final double? offPrice;
  // final double? offer;
  // final double? save;

  // final String? imageUrl;
  // final List<String>? image;
  // final List<String>? aboutTheProdut;
  // final List<String>? benefits;
  // final List<String>? storageAndUses;

  // Fruits({
  //   this.name,
  //   required this.id,
  //   this.description,
  //   this.unit,
  //   this.price,
  //   this.offer,
  //   this.imageUrl,
  //   this.image,
  //   this.aboutTheProdut,
  //   this.benefits,
  //   this.storageAndUses,
  // })  : offPrice = price! - (price * offer! / 100),
  //       save = (price * offer / 100);

  // @override
  // List<Object?> get props => [
  //       name,
  //       id,
  //       description,
  //       unit,
  //       price,
  //       offer,
  //       imageUrl,
  //       image,
  //       aboutTheProdut,
  //       benefits,
  //       storageAndUses,
  //       offPrice,
  //       save,
  //     ];

}
