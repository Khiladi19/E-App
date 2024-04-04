// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  
  // static final catModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModel;

static List<Item> items = [
  ];
  // get item by id
   Item getById(int id) => items.firstWhere(
        (element) => element.id == id,
      );

  // item get by postion
  Item getByPostion(int pos) => items[pos];


  // static List<Item> items = [
  //   Item(
  //     id: 1,
  //     name: "iphone 14 Pro",
  //     desc: "Apple iphone 14th genration",
  //     prices: 1200,
  //     color: "#3350a",
  //     image:
  //         "https://static.toiimg.com/photo/80635304/Apple-iPhone-14-Pro-Max-512GB-6GB-RAM.jpg",
  //     // image: "assets/images/iphone14.jpeg"
  //   )
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num prices;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.prices,
    required this.color,
    required this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? prices,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      prices: prices ?? this.prices,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'prices': prices,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      prices: map['prices'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, prices: $prices, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.prices == prices &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        prices.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
