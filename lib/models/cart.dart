import 'package:json_annotation/json_annotation.dart';
import 'package:stripe_app/models/product.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product {
  int count = 0;
  Cart(String title, double price, String id, String decription, String image,
      String category, this.count)
      : super(title, price, id, decription, image, category);
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartfromJson(json);
}
