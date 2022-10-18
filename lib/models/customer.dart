import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skels/models/city.dart';

part 'customer.g.dart';

const int customerHiveId = 1;

@JsonSerializable()
@HiveType(typeId: customerHiveId)
class Customer {
  @HiveField(0)
  @JsonKey(name: 'id')
  final String? id;

  @HiveField(2)
  @JsonKey(name: 'name')
  final String name;

  @HiveField(7)
  @JsonKey(name: 'fulfilment_center')
  final int fulfillmentCenterCode;

  @HiveField(9)
  @JsonKey(name: 'city_data')
  final City? city;

  ///will probably not be present on the endpoint object
  ///but should be present in the saved customer object
  @HiveField(10)
  @JsonKey(name: 'delivery_methode')
  final DeliveryMethod? deliveryMethod;

  Customer({
    this.id,
    required this.name,
    required this.fulfillmentCenterCode,
    this.city,
    this.deliveryMethod,
  });
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  Customer copyWith({
    String? id,
    String? phoneNumber,
    String? name,
    String? address,
    double? lat,
    double? lng,
    bool? old,
    int? fulfillmentCenterCode,
    City? city,
    DeliveryMethod? deliveryMethod,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      fulfillmentCenterCode:
          fulfillmentCenterCode ?? this.fulfillmentCenterCode,
      city: city ?? this.city,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
    );
  }

  @override
  String toString() {
    return '''Customer{id: $id,
    fulfilmentCentterCode: ${fulfillmentCenterCode.toString()},
    city: ${city.toString()},
    deliveryMethod: ${deliveryMethod.toString()},
    ''';
  }
}

const int deliveryMethodHiveId = 4;

@HiveType(typeId: deliveryMethodHiveId)
enum DeliveryMethod {
  @HiveField(0)
  pickup,
  @HiveField(1)
  delivery,
  @HiveField(2)
  unselected,
}

//Expand the options
extension Convert on DeliveryMethod {
  int toInt() {
    return this == DeliveryMethod.pickup
        ? 2
        : this == DeliveryMethod.delivery
            ? 1
            : 0;
  }
}
