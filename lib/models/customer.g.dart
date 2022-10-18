// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerAdapter extends TypeAdapter<Customer> {
  @override
  final int typeId = 1;

  @override
  Customer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customer(
      id: fields[0] as String?,
      name: fields[2] as String,
      fulfillmentCenterCode: fields[7] as int,
      city: fields[9] as City?,
      deliveryMethod: fields[10] as DeliveryMethod?,
    );
  }

  @override
  void write(BinaryWriter writer, Customer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.fulfillmentCenterCode)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.deliveryMethod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeliveryMethodAdapter extends TypeAdapter<DeliveryMethod> {
  @override
  final int typeId = 4;

  @override
  DeliveryMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DeliveryMethod.pickup;
      case 1:
        return DeliveryMethod.delivery;
      case 2:
        return DeliveryMethod.unselected;
      default:
        return DeliveryMethod.pickup;
    }
  }

  @override
  void write(BinaryWriter writer, DeliveryMethod obj) {
    switch (obj) {
      case DeliveryMethod.pickup:
        writer.writeByte(0);
        break;
      case DeliveryMethod.delivery:
        writer.writeByte(1);
        break;
      case DeliveryMethod.unselected:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String?,
      name: json['name'] as String,
      fulfillmentCenterCode: json['fulfilment_center'] as int,
      city: json['city_data'] == null
          ? null
          : City.fromJson(json['city_data'] as Map<String, dynamic>),
      deliveryMethod: $enumDecodeNullable(
          _$DeliveryMethodEnumMap, json['delivery_methode']),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fulfilment_center': instance.fulfillmentCenterCode,
      'city_data': instance.city,
      'delivery_methode': _$DeliveryMethodEnumMap[instance.deliveryMethod],
    };

const _$DeliveryMethodEnumMap = {
  DeliveryMethod.pickup: 'pickup',
  DeliveryMethod.delivery: 'delivery',
  DeliveryMethod.unselected: 'unselected',
};
