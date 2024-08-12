// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DummyJsonImpl _$$DummyJsonImplFromJson(Map<String, dynamic> json) =>
    _$DummyJsonImpl(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DummyJsonImplToJson(_$DummyJsonImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
