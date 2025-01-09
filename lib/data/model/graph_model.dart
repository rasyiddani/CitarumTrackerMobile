import 'dart:convert';
/// impendance : 1000.0
/// date : "1970-01-01"

GraphModel graphModelFromJson(String str) => GraphModel.fromJson(json.decode(str));
String graphModelToJson(GraphModel data) => json.encode(data.toJson());
class GraphModel {
  GraphModel({
      num? impendance, 
      String? date,}){
    _impendance = impendance;
    _date = date;
}

  GraphModel.fromJson(dynamic json) {
    _impendance = json['impendance'];
    _date = json['date'];
  }
  num? _impendance;
  String? _date;
GraphModel copyWith({  num? impendance,
  String? date,
}) => GraphModel(  impendance: impendance ?? _impendance,
  date: date ?? _date,
);
  num? get impendance => _impendance;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['impendance'] = _impendance;
    map['date'] = _date;
    return map;
  }

}