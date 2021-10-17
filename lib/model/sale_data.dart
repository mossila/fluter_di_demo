import 'package:json_annotation/json_annotation.dart';

part 'sale_data.g.dart';

@JsonSerializable()
class SaleData {
  late String year;
  late double sales;

  SaleData({required this.year, required this.sales});

  factory SaleData.fromJson(Map<String, dynamic> json) =>
      _$SaleDataFromJson(json);

  Map<String, dynamic> toJson() => _$SaleDataToJson(this);
}
