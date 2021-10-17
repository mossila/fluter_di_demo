// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleData _$SaleDataFromJson(Map<String, dynamic> json) => SaleData(
      year: json['year'] as String,
      sales: (json['sales'] as num).toDouble(),
    );

Map<String, dynamic> _$SaleDataToJson(SaleData instance) => <String, dynamic>{
      'year': instance.year,
      'sales': instance.sales,
    };
